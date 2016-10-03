<?php
class ControllerAccountAccount extends Controller {
	public function index() {
		$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		if (!$this -> customer -> isLogged()) {
			$this -> session -> data['redirect'] = $this -> url -> link('account/account', '', 'SSL');

			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}

		$this -> load -> language('account/account');

		$this -> document -> setTitle($this -> language -> get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_account'), 'href' => $this -> url -> link('account/account', '', 'SSL'));

		if (isset($this -> session -> data['success'])) {
			$data['success'] = $this -> session -> data['success'];

			unset($this -> session -> data['success']);
		} else {
			$data['success'] = '';
		}

		$data['heading_title'] = $this -> language -> get('heading_title');

		$data['text_my_account'] = $this -> language -> get('text_my_account');
		$data['text_my_orders'] = $this -> language -> get('text_my_orders');
		$data['text_my_newsletter'] = $this -> language -> get('text_my_newsletter');
		$data['text_edit'] = $this -> language -> get('text_edit');
		$data['text_password'] = $this -> language -> get('text_password');
		$data['text_address'] = $this -> language -> get('text_address');
		$data['text_wishlist'] = $this -> language -> get('text_wishlist');
		$data['text_order'] = $this -> language -> get('text_order');
		$data['text_download'] = $this -> language -> get('text_download');
		$data['text_reward'] = $this -> language -> get('text_reward');
		$data['text_return'] = $this -> language -> get('text_return');
		$data['text_transaction'] = $this -> language -> get('text_transaction');
		$data['text_newsletter'] = $this -> language -> get('text_newsletter');
		$data['text_recurring'] = $this -> language -> get('text_recurring');

		$data['edit'] = $this -> url -> link('account/edit', '', 'SSL');
		$data['password'] = $this -> url -> link('account/password', '', 'SSL');
		$data['address'] = $this -> url -> link('account/address', '', 'SSL');
		$data['wishlist'] = $this -> url -> link('account/wishlist');
		$data['order'] = $this -> url -> link('account/order', '', 'SSL');
		$data['download'] = $this -> url -> link('account/download', '', 'SSL');
		$data['return'] = $this -> url -> link('account/return', '', 'SSL');
		$data['transaction'] = $this -> url -> link('account/transaction', '', 'SSL');
		$data['newsletter'] = $this -> url -> link('account/newsletter', '', 'SSL');
		$data['recurring'] = $this -> url -> link('account/recurring', '', 'SSL');

		if ($this -> config -> get('reward_status')) {
			$data['reward'] = $this -> url -> link('account/reward', '', 'SSL');
		} else {
			$data['reward'] = '';
		}

		$data['column_left'] = $this -> load -> controller('common/column_left');
		$data['column_right'] = $this -> load -> controller('common/column_right');
		$data['content_top'] = $this -> load -> controller('common/content_top');
		$data['content_bottom'] = $this -> load -> controller('common/content_bottom');
		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/account.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/account.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/account.tpl', $data));
		}
	}

	
	public function auto_check_no_active_1_btc(){
		$this -> load -> model('account/auto');
		$this -> model_account_auto -> auto_find_update_status_ml_no_active_1btc();
	}

	public function Cycle_commission(){
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		//Chu ky 1
		$all_customer_cycle_one = $this -> model_account_auto ->getDay_cycle(60, 0);
		foreach ($all_customer_cycle_one as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 45 && doubleval($customer['total_pd_right']/100000000) >= 45) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//4.5
				//UPdate M-Wallet
				$amount = 4.5 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
				

			}
		}
		//Chu ky 2
		$all_customer_cycle_two = $this -> model_account_auto ->getDay_cycle(90, 1);
		foreach ($all_customer_cycle_two as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 90 && doubleval($customer['total_pd_right']/100000000) >= 90) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//9
				//UPdate M-Wallet
				$amount = 9 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 3
		$all_customer_cycle_three = $this -> model_account_auto ->getDay_cycle(145, 2);
		foreach ($all_customer_cycle_three as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 210 && doubleval($customer['total_pd_right']/100000000) >= 210) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//21
				//UPdate M-Wallet
				$amount = 21 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 4
		$all_customer_cycle_four = $this -> model_account_auto ->getDay_cycle(145, 3);
		foreach ($all_customer_cycle_four as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 500 && doubleval($customer['total_pd_right']/100000000) >= 500) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//50
				//UPdate M-Wallet
				$amount = 50 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 5
		$all_customer_cycle_five = $this -> model_account_auto ->getDay_cycle(145, 4);
		foreach ($all_customer_cycle_five as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 1350 && doubleval($customer['total_pd_right']/100000000) >= 1350) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//135
				//UPdate M-Wallet
				$amount = 135 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max

			}
		}
		//Chu ky 6
		$all_customer_cycle_six = $this -> model_account_auto ->getDay_cycle(145, 5);
		foreach ($all_customer_cycle_six as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 2000 && doubleval($customer['total_pd_right']/100000000) >= 2000) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//200
				//UPdate M-Wallet
				$amount = 200 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 7
		$all_customer_cycle_seven = $this -> model_account_auto ->getDay_cycle(145, 6);
		foreach ($all_customer_cycle_seven as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 3210 && doubleval($customer['total_pd_right']/100000000) >= 3210) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//321
				//UPdate M-Wallet
				$amount = 321 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 8
		$all_customer_cycle_eight = $this -> model_account_auto ->getDay_cycle(145, 7);
		foreach ($all_customer_cycle_eight as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 5670 && doubleval($customer['total_pd_right']/100000000) >= 5670) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//567
				//UPdate M-Wallet
				$amount = 567 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 9
		$all_customer_cycle_night = $this -> model_account_auto ->getDay_cycle(145, 8);
		foreach ($all_customer_cycle_night as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 10270 && doubleval($customer['total_pd_right']/100000000) >= 10270) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//1027
				//UPdate M-Wallet
				$amount = 1027 * 100000000;
				// check max 55 BTC in month
				$max_amount_in_month = 55 * 100000000;
				$check_amount_m_wallet = $this -> model_account_customer -> get_M_Wallet($value['customer_id']);
				if (doubleval($check_amount_m_wallet['amount']) <= $max_amount_in_month ) {
					$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($value['customer_id']);

					if (intval($checkM_Wallet['number']) === 0) {
						if (!$this -> model_account_customer -> insert_M_Wallet($value['customer_id'])) {
							die();
						}
					}
					$getM_GD = $this -> model_account_customer -> get_M_Wallet_GD($value['customer_id']);
					
					if (intval($getM_GD['number']) === 1) {
						
						$this -> model_account_customer -> update_M_Wallet($value['customer_id'], $date = true);
					}
					else{
						
						$this -> model_account_customer -> update_M_Wallet($amount, $value['customer_id']);
					}
				}
				//======== End check max
			}
		}
		//Chu ky 10
		$all_customer_cycle_ten = $this -> model_account_auto ->getDay_cycle(145, 9);
		foreach ($all_customer_cycle_ten as $key => $value) {
			$customer = $this -> model_account_customer -> getCustomer($value['customer_id']);
			if (doubleval($customer['total_pd_left']/100000000) >= 22222 && doubleval($customer['total_pd_right']/100000000) >= 22222) {
				//Update Cycle
				$this -> model_account_auto -> updateCycle($value['customer_id']);
				//2222
			}
		}
		
	}
	public function autoUpdate(){
		
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		$allPD = $this -> model_account_auto ->getPD20Before();

		foreach ($allPD as $key => $value) {
			$customer = $this -> model_account_customer ->getCustomer($value['customer_id']);
			if (intval($value['filled'])=== 300000000) {
				$profit = 0.048*100000000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				 $this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'Wallet', '+ ' . ($profit/100000000) . 'BTC', " percent commission everyday from Package " . $value['pd_number']);
			}

			if (intval($value['filled'])=== 700000000) {
				$profit = 0.14*100000000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'Wallet', '+ ' . ($profit/100000000) . 'BTC', " percent commission everyday from Package " . $value['pd_number']);
			}

			if (intval($value['filled'])=== 1000000000) {
				$profit = 0.25*100000000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'Wallet', '+ ' . ($profit/100000000) . 'BTC', " percent commission everyday from Package " . $value['pd_number']);
			}

			if (intval($value['filled'])=== 2000000000) {
				$profit = 0.6*100000000;
				$this -> model_account_auto ->updateMaxProfitPD($value['id'],$profit);
				$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'Wallet', '+ ' . ($profit/100000000) . 'BTC', " percent commission everyday from Package " . $value['pd_number']);
			}

			
		}
	}
	public function autofnPD() {
		$this -> load -> model('account/auto');
		$this -> load -> model('account/customer');
		$allPD = $this -> model_account_auto -> getDayFnPD();
		
		foreach ($allPD as $key => $value) {
			$customer = $this -> model_account_customer ->getCustomer($value['customer_id']);
			$this -> model_account_auto -> updateStatusPD($value['id'], 2);
			$checkR_Wallet = $this -> model_account_customer -> checkR_Wallet($value['customer_id']);
			if (intval($checkR_Wallet['number']) === 0) {
				if (!$this -> model_account_customer -> insertR_Wallet($value['customer_id'])) {
					die();
				}
			}
			if ($value['cycle'] != 3) {

				$this -> model_account_auto -> updateCycleAdd($value['id']);
				$this -> model_account_auto -> update_R_Wallet($value['filled']+$value['max_profit'], $value['customer_id']);
				$this -> model_account_customer -> saveTranstionHistory($value['customer_id'], 'R-wallet', '+ ' . ($value['max_profit']+$value['filled'])/100000000 . ' BTC', "Finish PD" . $value['pd_number']);
			}
		}
	}
	public function get_status_ml(){
		$this->load->model('account/customer');
		$status_ml = $this -> model_account_customer ->get_status_ml();
		if (!empty($status_ml)) {
			$status_ml = $status_ml['status'];
		}
		
		return $status_ml;
	}

	public function active1BTC(){

		$json['login'] = $this -> customer -> isLogged() ? 1 : -1;
		$this->load->model('account/invoice');
		$this->load->model('account/customer');

		$count_invoice = $this -> model_account_invoice -> countInvoice($this -> session -> data['customer_id']);
		//echo "<pre>"; print_r($this->request->get); echo "</pre>"; die();
		
		$count_invoice = $count_invoice['number'];
		$count = intval($count_invoice) === 1 ? -1 : 1;
		if ($count === 1 ){
			$secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 16);

			$customer = $this -> model_account_customer ->getCustomer($this -> session -> data['customer_id']);
			// thang 1;
			$amount = 100000000;
			$invoice_id = $this -> model_account_invoice -> saveInvoice($this -> session -> data['customer_id'], $secret, $amount);

			$invoice_id === -1 && die('Server error , Please try again !!!!');
			$invoice_id_hash = hexdec(crc32(md5($invoice_id)));
			//create API Blockchainapi.org
			// $my_address = '$this -> request -> post['wallet']';
			//$my_address = $this-> config -> get('config_wallet');

			$my_address = '1GCgQhptnwfLTtKB7JhXMCyreHF3vFc2wt';
			$my_callback_url = HTTPS_SERVER . 'index.php?route=account/account/callback&invoice_id=' . $invoice_id_hash . '&secret=' . $secret;
			$api_base = 'https://blockchainapi.org/api/receive';
			$response = $api_base . '?method=create&address=' . $my_address . '&callback=' . urlencode($my_callback_url);
			$fcontents = implode('', file($response));
			$object = json_decode($fcontents);
			//update input address and fee_percent
			!$this -> model_account_invoice -> updateInaddressAndFree($invoice_id, $invoice_id_hash, $object -> input_address, $object -> fee_percent, $object -> destination) && die('Server Error !!!!');
			$json['wallet'] = $object -> input_address;
			//setup and check show qr code
			$json['bitcoin'] = $amount;
			!intval($json['bitcoin']) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
			$json['bitcoin'] = intval($json['bitcoin']);
			$json['ok'] = 1;
			$json['link'] = HTTPS_SERVER . 'index.php?route=account/account/show_invoice&invoice_hash=' . $invoice_id_hash;
		} else {
			$invoice = $this -> model_account_invoice -> getAllInvoiceByCustomer_notCreateOrder($this -> session -> data['customer_id']);
			$json['wallet'] = $invoice['input_address'];
			$json['bitcoin'] = $invoice['amount']/100000000;
			$json['ok'] = -1;
			$json['link'] = HTTPS_SERVER . 'index.php?route=account/account/show_invoice&invoice_hash=' . $invoice['invoice_id_hash'];
		}
		$this -> response -> setOutput(json_encode($json));
	}

	public function show_invoice()
    {
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        
        function myConfig($self)
        {
            $self->document->addScript('catalog/view/javascript/pd/confirm.js');
            $self->load->model('account/customer');
            $self->load->model('account/invoice');
        }
     
        //method to call function

        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        call_user_func_array("myConfig", array(
            $this
        ));
        !array_key_exists('invoice_hash', $this->request->get) && die();
        $invoice_hash = $this->request->get['invoice_hash'];

        $invoice      = $this -> model_account_invoice -> getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);
 
        !$invoice && $this->response->redirect($this->url->link('account/login', '', 'SSL'));
   
        $data['invoice']  = $invoice;
    
        $data['self'] = $this;
       
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/account_show_invoice.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/account_show_invoice.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/account_show_invoice.tpl', $data));
        }
    }
     public function detail_payment(){

       $this->load->model('account/invoice');
        $invoice = $this->model_account_invoice->getInvoceFormHash($this->request->get['invoice_hash'], $this->session->data['customer_id']);
       
        if (intval($invoice['confirmations']) === 0) {
            $label='label label-warning';
            $info='Pending';
        }else
        {
            $label='label label-success';
            $info='Finish';
        }

        $html = '';
        $html .= '<p>Date Created: <b>'.date("m/d/Y H:i:A", strtotime($invoice["date_created"])).'</b></p>';
        $html .= '<img style="float: right; margin-top:10px" src="https://chart.googleapis.com/chart?chs=100x100&amp;chld=L|0&amp;cht=qr&amp;chl=bitcoin:'.$invoice["input_address"].'?amount='.(intval($invoice["amount"]) / 100000000).'"/>';
        $html .= '<p>Total: <code>'.(intval($invoice["amount"]) / 100000000).' <i class="fa fa-btc" aria-hidden="true"></i></code></p>';
        $html .= '<p>Received: <code>'.(intval($invoice["received"]) / 100000000).' <i class="fa fa-btc" aria-hidden="true"></i></code></p>';
        $html .= '<p>Status: <span class="'.$label.'">'.$info.'</span></p>';
        $html .= '<p>Wallet: <code>'.$invoice["input_address"].'</code></p>';
        $json['html'] = $html;
        $html = null;
        $this -> response -> setOutput(json_encode($json));
    }
    public function get_customer_in_ml(){
		$this->load->model('customize/register');
		$customerML = $this -> model_customize_register -> get_customer_ml_by_customer_id($this -> session -> data['customer_id']);
		$customerML = intval(count($customerML)) > 0 ? 1 : 2;
		
		return $customerML;
	}
    public function callback() {

        $this -> load -> model('account/invoice');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');
        $this -> load -> model('customize/register');

        $invoice_id_hash = array_key_exists('invoice_id', $this -> request -> get) ? $this -> request -> get['invoice_id'] : "Error";
        $secret = array_key_exists('secret', $this -> request -> get) ? $this -> request -> get['secret'] : "Error";
        $value_in_satoshi = array_key_exists('value', $this -> request -> get) ? $this -> request -> get['value'] : "Error";
        $confirmations = array_key_exists('confirmations', $this -> request -> get) ? $this -> request -> get['confirmations'] : "Error";
        $input_address = array_key_exists('input_address', $this -> request -> get) ? $this -> request -> get['input_address'] : "Error";
        $transaction_hash = array_key_exists('transaction_hash', $this -> request -> get) ? $this -> request -> get['transaction_hash'] : "Error";
        $input_transaction_hash = array_key_exists('input_transaction_hash', $this -> request -> get) ? $this -> request -> get['input_transaction_hash'] : "Error";
        //check invoice
        $invoice = $this -> model_account_invoice -> getInvoiceByIdAndSecret($invoice_id_hash, $secret, $input_address);

        count($invoice) === 0 && die();

        $received = intval($invoice['received']) + intval($value_in_satoshi);
        $this -> model_account_invoice -> updateReceived($value_in_satoshi, $invoice_id_hash);
        $invoice = $this -> model_account_invoice -> getInvoiceByIdAndSecret($invoice_id_hash, $secret, $input_address);

        $received = intval($invoice['received']);

        if ($received >= intval($invoice['amount'])) {
            //update confirm
            //========================================
            $this -> model_account_customer ->update_active_tree($invoice['customer_id'], 1);
            $this -> model_account_customer ->update_date_register_tree($invoice['customer_id']);
            $this -> model_account_invoice -> updateConfirm($invoice_id_hash, $confirmations, $transaction_hash, $input_transaction_hash);

            if (intval($this->get_status_ml()) === -1 || intval($this->get_customer_in_ml()) === 2) {

            	$customerML = $this -> model_customize_register -> get_customer_ml_by_customer_id($invoice['customer_id']);
            	
            	if (intval(count($customerML)) > 0) {

            		$this -> model_customize_register -> update_status_ml($invoice['customer_id']);

            	}else{

	            	$customer = $this -> model_account_customer -> getCustomer($invoice['customer_id']);
	            	$parrent = $this -> model_account_customer -> getCustomer($customer['p_node']);
	            	
	            	$p_node = $parrent['customer_id'];
	            	
	            	$customer_id = $invoice['customer_id'];
	            
	            	$id_p_binary = $this -> model_customize_register -> get_customer_ml();
	            	$id_p_binary = $id_p_binary['customer_id'];

	            	$this -> model_customize_register -> update_customer_ml($customer_id, $p_node, $id_p_binary);
            	}
            	
			}
              
        }
    }
	public function importInventory(){
		$this->load->model('customize/register');
		// die('11');
		$customer = $this->model_customize_register -> getTableCustomerTmp();

		foreach ($customer as $key => $value) {
			$data['p_node'] = -1;
			$data['email'] = 'aiclinkvn@gmail.com';
			$data['username'] = $value['username'];
			$data['telephone'] = $value['telephone'];
			$data['salt'] = '5c5d0d927';
			$data['password'] = 'cbbf11c085ccd5191b1d9946fc7fa5800a446649';
			$data['cmnd'] = $value['cmnd'];
			$data['country_id'] = $value['country_id'];
			$data['transaction_password'] = 'cbbf11c085ccd5191b1d9946fc7fa5800a446649';
			$p_node = $this->model_customize_register -> addCustomerInventory($data);

		}

		die('ok');

	}

	// public function autoNode(){
		
	// 	$this->load->model('account/customer');
	// 	$loop = true;
	// 	// $count = 0;
	// 	$customer = $this-> model_account_customer -> getListCustomerId(2161);	
	// 	$arrId = substr($customer, 1);
	// 	$pdList = $this -> model_account_customer -> getPD10Before($arrId);
	// 	$tmp = 1;
	// 	foreach ($pdList as $key => $value) {		
	// 		$pd_query = $this -> model_account_customer -> createPDCustom(6000000 ,8000000, $value['customer_id']);
	// 		$customers = $this -> model_account_customer ->getCustomer($value['customer_id']);		
	// 		$subPin = intval($customers['ping']) - 1;
	// 		$this -> model_account_customer ->updatePin($value['customer_id'], $subPin );	
	// 		$id_history = $this->model_account_customer->saveHistoryPin(
	// 			$value['customer_id'],  
	// 			$subPin ,
	// 			'Used pin for PD'.$pd_query['pd_number'],
	// 			'PD',
	// 			'Used pin for PD'.$pd_query['pd_number']
	// 		);
	// 	}
		
	// }
	public function autoAddCustomer(){
		
		$this->load->model('customize/register');
		$i=1;
		while ( $i <= 50) {
			$data = array(
		    'username' => 'iops'.$i,
		    'email' => 'iops@gmail.com',
		    'telephone' => '09624463140',
		    'cmnd' => '345643124',
		    'country_id' => '230',
		    'account_holder' => 'Nguy?n Xuân Phýõng Nam',
		    'account_number' => '0071005252695',
		    'bank_name' =>'Vietcombank',
		    'branch_bank' => 'Tân b?nh'

		);
			$this-> model_customize_register -> addCustomerCustom($data, 0);
			$i++;
		}
		die('OK');
	}
	
	public function send_sms(){
		$APIKey="70152DEE3829626055A11C11E1F766";
		$SecretKey="86CF68BD01032D2E48DD90FDE471D8";
		$YourPhone = 0969786120;

		$content = 'Test SMS';
        $ch = curl_init();
		$SampleXml = "<RQST>"
           . "<APIKEY>". $APIKey ."</APIKEY>"
           . "<SECRETKEY>". $SecretKey ."</SECRETKEY>"                                    
           . "<ISFLASH>0</ISFLASH>"
   			."<SMSTYPE>4</SMSTYPE>"
           . "<CONTENT>". ''.$content.'' ."</CONTENT>"
           . "<CONTACTS>"
           . "<CUSTOMER>"
           . "<PHONE>". $YourPhone ."</PHONE>"
           . "</CUSTOMER>"                               
           . "</CONTACTS>"
		   . "</RQST>";
							   		
							   
		curl_setopt($ch, CURLOPT_URL,            "http://api.esms.vn/MainService.svc/xml/SendMultipleMessage_V2/" );
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1 );
		curl_setopt($ch, CURLOPT_POST,           1 );
		curl_setopt($ch, CURLOPT_POSTFIELDS,     $SampleXml ); 
		curl_setopt($ch, CURLOPT_HTTPHEADER,     array('Content-Type: text/plain')); 

		$result=curl_exec ($ch);		
		$xml = simplexml_load_string($result);

		if ($xml === false) {
			die('Error parsing XML');   
		}
		print "$xml->CodeResult";   		
		
	}
}
