<?php
class ControllerAccountPrice extends Controller {

	public function index() {
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self->document->addScript('catalog/view/javascript/pd/confirm.js');
             $self->document->addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
            $self->document->addScript('catalog/view/javascript/pd/countdown.js');
		};

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/pd');
		$data['lang'] = $language -> data;
		$data['getLanguage'] = $getLanguage;

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		//get r_wallet AND c_wallet USER
		$page         = isset($this->request->get['page']) ? $this->request->get['page'] : 1;
        
        $limit    = 10;
        $start    = ($page - 1) * 10;
        $pd_total = $this->model_account_customer->getTotalPD($this->session->data['customer_id']);
        
        $pd_total = $pd_total['number'];
        
        $pagination            = new Pagination();
        $pagination->total     = $pd_total;
        $pagination->page      = $page;
        $pagination->limit     = $limit;
        $pagination->num_links = 5;
        $pagination->text      = 'text';
        $pagination->url       = $this->url->link('account/price', 'page={page}', 'SSL');
        
        $data['pds']        = $this->model_account_customer->getPDById($this->session->data['customer_id'], $limit, $start);
        $data['pagination'] = $pagination->render();
      
		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/price.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/price.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/price.tpl', $data));
		}
	}
    public function create() {
        function myCheckLoign($self) {
            return $self -> customer -> isLogged() ? true : false;
        };

        function myConfig($self) {
            $self->document->addScript('catalog/view/javascript/pd/confirm.js');
             $self->document->addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
            $self->document->addScript('catalog/view/javascript/pd/countdown.js');
        };

        //language
        $this -> load -> model('account/customer');
        $getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
        $language = new Language($getLanguage);
        $language -> load('account/pd');
        $data['lang'] = $language -> data;
        $data['getLanguage'] = $getLanguage;

        //method to call function
        !call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
        call_user_func_array("myConfig", array($this));

        //get r_wallet AND c_wallet USER
        $page         = isset($this->request->get['page']) ? $this->request->get['page'] : 1;
        
        $limit    = 10;
        $start    = ($page - 1) * 10;
        $pd_total = $this->model_account_customer->getTotalPD($this->session->data['customer_id']);
        
        $pd_total = $pd_total['number'];
        
        $pagination            = new Pagination();
        $pagination->total     = $pd_total;
        $pagination->page      = $page;
        $pagination->limit     = $limit;
        $pagination->num_links = 5;
        $pagination->text      = 'text';
        $pagination->url       = $this->url->link('account/price', 'page={page}', 'SSL');
        
        $data['pds']        = $this->model_account_customer->getPDById($this->session->data['customer_id'], $limit, $start);
        $data['pagination'] = $pagination->render();
      
        $server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
        $data['base'] = $server;
        $data['self'] = $this;

        if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/price_create.tpl')) {
            $this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/price_create.tpl', $data));
        } else {
            $this -> response -> setOutput($this -> load -> view('default/template/account/price_create.tpl', $data));
        }
    }
    public function get_package(){
        $this->load->model('account/customer');
        $package = $this->model_account_customer->getPackage();
        $package=intval($package['package']);
        return $package;
    }
	public function paymentSubmit()
    {
        
        $json['login'] = $this->customer->isLogged() ? 1 : -1;
        $json['login'] === -1 && die();

        if ($this->customer->isLogged() && $this->request->get['amount']) {
            $this->load->model('account/customer');
            $check_status_pd = $this -> model_account_customer -> getStatusPD();
            $check_status_pd = $check_status_pd['pdtotal'];
            $json['check_status_pd'] = $check_status_pd === '0' ? 1 : -1;

            if ($json['check_status_pd'] === 1 ) {
                
                	$package = $this->request->get['amount'];
                	switch ($package) {
                		case 1:
                			$amount = 5000000;
                			break;
                		case 2:
                			$amount = 20000000;
                            break;
                		case 3:
                			$amount = 50000000;
                			break;
                		case 4:
                			$amount = 100000000;
                			break;
                        case 5:
                            $amount = 500000000;
                            break;
                        case 6:
                            $amount = 1000000000;
                            break;

                	}
                	$max_profit = 0;
                	
                    $pd_query = $this->model_account_customer->createPD($amount, $max_profit);
                    $this->model_account_customer->update_package($this->session->data['customer_id'], $this->request->get['amount']);

                   

                    $this->load->model('account/pd');
                    $secret = substr(hash_hmac('ripemd160', hexdec(crc32(md5(microtime()))), 'secret'), 0, 16);
                    
                    $invoice_id = $this->model_account_pd->saveInvoice($this->session->data['customer_id'], $secret, $amount, $pd_query['pd_number']);
                    
                    $invoice_id === -1 && die('Server error , Please try again !!!!');
                    $invoice_id_hash = hexdec(crc32(md5($invoice_id)));
                    //create API Blockchainapi.org
                    // $my_address      = '13PoipXqDALMScTiagY6WrJvfTqAT9crxB';
                    
                    // 1MNnn7FN1Q5eCNmSmcWMKjPvRAAC6yx46e
                    
                    // $my_callback_url = HTTPS_SERVER . 'index.php?route=account/price/callback&invoice_id=' . $invoice_id_hash . '&secret=' . $secret;
                    
                    // $api_base = 'https://blockchainapi.org/api/receive';
                    // $response = file_get_contents($api_base . '?method=create&address=' . $my_address . '&callback=' . urlencode($my_callback_url));
                    
                    // $object = json_decode($response);
                    //update input address and fee_percent
                    !$this->model_account_pd->updateInaddressAndFree($invoice_id, $invoice_id_hash, $invoice_id_hash, $invoice_id_hash, $invoice_id_hash) && die('Server Error !!!!');

                    $json['link'] = HTTPS_SERVER . 'index.php?route=account/price/show_invoice&invoice_hash=' . $invoice_id_hash;
                    $json['ok'] = 1;
                
            } else {

                $json['ok'] = -1;
            }

            $this->response->setOutput(json_encode($json)); 
        }
    }
    public function getActive_tree(){
        $this->load->model('account/customer');
        $active_tree = $this -> model_account_customer ->getActive_tree();
        if (!empty($active_tree)) {
            $active_tree = $active_tree['active_tree'];
        }
        
        return $active_tree;
    }
    public function show_invoice()
    {
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
        ;
        function myConfig($self)
        {
            $self->document->addScript('catalog/view/javascript/pd/confirm.js');
            $self->load->model('account/customer');
            $self->load->model('account/pd');
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
        $invoice      = $this->model_account_pd->getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);

        !$invoice && $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        
        $count_invoice     = $this->model_account_pd->countPD($this->session->data['customer_id']);
        $data['package'] = $this -> model_account_customer -> get_package();
        $count_invoice     = $count_invoice['number'];
        $data['notCreate'] = false;
        if ($count_invoice > 7) {
            $data['notCreate'] = true;
            $data['invoice']   = $this->model_account_pd->getAllInvoiceByCustomer_notCreateOrder($this->session->data['customer_id']);
        } else {
            $data['bitcoin'] = $invoice['amount'];
            $data['wallet']  = $invoice['input_address'];
            $data['invoice']   = $this->model_account_pd->getInvoceFormHash($invoice_hash, $this->session->data['customer_id']);
        }
        $data['self'] = $this;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/price_show_invoice.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/price_show_invoice.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/price_show_invoice.tpl', $data));
        }
    }
    public function payconfirm()
    {
        function myCheckLoign($self)
        {
            return $self->customer->isLogged() ? true : false;
        }
       
        
        function myConfig($self)
        {
            $self->load->model('account/customer');
            $self->document->addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
            $self->document->addScript('catalog/view/javascript/pd/countdown.js');
            $self->document->addScript('catalog/view/javascript/pd/confirm.js');
        }
       
        !$this->request->get['token'] && $this->response->redirect($this->url->link('account/dashboard', '', 'SSL'));

        !call_user_func_array("myCheckLoign", array(
            $this
        )) && $this->response->redirect($this->url->link('account/login', '', 'SSL'));
        call_user_func_array("myConfig", array(
            $this
        ));
        
        //language
        $this->load->model('account/customer');
      
        $server       = $this->request->server['HTTPS'] ? $server = $this->config->get('config_ssl') : $server = $this->config->get('config_url');
        $data['base'] = $server;
        $data['self'] = $this;
      
        $PdUser = $this->model_account_customer->getPDConfirm_ByTranfer($this->request->get['token'], $this->session->data['customer_id']);
        count($PdUser) === 0 && $this->response->redirect($this->url->link('account/price', '', 'SSL'));

        //get PD

        $PD_by_Status = $this->model_account_customer-> getPD_By_PD_Numner($this->request->get['token']);
        count($PD_by_Status) === 0 && $this->response->redirect($this->url->link('account/price', '', 'SSL'));

        $PD_by_Status = intval($PD_by_Status['status']);

        $data['package'] = $this -> model_account_customer -> get_package();

        $PD_by_Status !== 0 && $this->response->redirect($this->url->link('account/price', '', 'SSL'));
        $PD_by_Status = null;
        $data['bitcoin'] = $PdUser['amount'];
        $data['date_added'] = $PdUser['date_created'];
        $data['invoice_hash'] = $PdUser['invoice_id_hash'];
        $data['wallet'] = $PdUser['input_address'];
        $PdUser = null;
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/price_confirm.tpl')) {
            $this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/price_confirm.tpl', $data));
        } else {
            $this->response->setOutput($this->load->view('default/template/account/price_confirm.tpl', $data));
        }
        
    }

    public function callback() {

        $this -> load -> model('account/pd');
        $this -> load -> model('account/auto');
        $this -> load -> model('account/customer');

        $invoice_id_hash = array_key_exists('invoice_id', $this -> request -> get) ? $this -> request -> get['invoice_id'] : "Error";
        $secret = array_key_exists('secret', $this -> request -> get) ? $this -> request -> get['secret'] : "Error";
        $value_in_satoshi = array_key_exists('value', $this -> request -> get) ? $this -> request -> get['value'] : "Error";
        $confirmations = array_key_exists('confirmations', $this -> request -> get) ? $this -> request -> get['confirmations'] : "Error";
        $input_address = array_key_exists('input_address', $this -> request -> get) ? $this -> request -> get['input_address'] : "Error";
        $transaction_hash = array_key_exists('transaction_hash', $this -> request -> get) ? $this -> request -> get['transaction_hash'] : "Error";
        $input_transaction_hash = array_key_exists('input_transaction_hash', $this -> request -> get) ? $this -> request -> get['input_transaction_hash'] : "Error";
        //check invoice
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id_hash, $secret, $input_address);

        count($invoice) === 0 && die();

        $received = intval($invoice['received']) + intval($value_in_satoshi);
        $this -> model_account_pd -> updateReceived($value_in_satoshi, $invoice_id_hash);
        $invoice = $this -> model_account_pd -> getInvoiceByIdAndSecret($invoice_id_hash, $secret, $input_address);

        $received = intval($invoice['received']);

        if ($received >= intval($invoice['amount'])) {
            //update confirm

            //========================================
            $this -> model_account_customer ->updateLevel($invoice['customer_id'], 2);
            $this -> model_account_pd -> updateConfirm($invoice_id_hash, $confirmations, $transaction_hash, $input_transaction_hash);
            
            $getPD = $this -> model_account_customer -> getAllPDByTranferID($invoice['transfer_id']);
            
                //$percent = floatval($this -> config -> get('config_percentcommission'));
                
                $amountPD = intval($getPD['filled']);

                switch ($amountPD) {
                    case 300000000:
                        $profit = 0.048*100000000;
                        break;
                    case 700000000:
                        $profit = 0.14*100000000;
                        break;
                    case 1000000000:
                        $profit = 0.35*100000000;
                        break;
                    case 2000000000:
                        $profit = 0.6*100000000;
                        break;
                   
                }
                $this -> model_account_customer -> saveTranstionHistory($invoice['customer_id'], 'Wallet', '+ $' . ($profit/100000000) . '', " percent commission everyday from Package " . $invoice['transfer_id']);
                $this -> model_account_pd -> updateDatefinishPD($invoice['transfer_id'], $profit,$transaction_hash, $input_transaction_hash);
                
           

                //update pd left and right
                //get customer_ml p_binary
                $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($invoice['customer_id']);
            
                $customer_first = true ;
                if(intval($customer_ml['p_binary']) !== 0){
                    while (true) {
                        //lay thang cha trong ban Ml
                        $customer_ml_p_binary = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml['p_binary']);

                        if($customer_first){
                            //kiem tra la customer dau tien vi day la gia tri callback mac dinh
                            if(intval($customer_ml_p_binary['left']) === intval($invoice['customer_id']) )  {
                                //nhanh trai
                                $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $invoice['amount'] );
                                
                            }else{
                                //nhanh phai
                                $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $invoice['amount'] );
                            }
                            $customer_first = false;
                        }else{
                
                            if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
                                //nhanh trai
                                $this -> model_account_customer -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $invoice['amount'] );
                                
                            }else{
                                //nhanh phai
                                $this -> model_account_customer -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $invoice['amount'] );
                            }
                        }
                        
                        

                        if(intval($customer_ml_p_binary['customer_id']) === 1){
                            break;
                        }
                        //lay tiep customer de chay len tren lay thang cha
                        $customer_ml = $this -> model_account_customer -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);

                    } 
                }

                 //=========Hoa hong bao tro=====================
                $customer = $this -> model_account_customer ->getCustomer($invoice['customer_id']);
                $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);
                   if (!empty($partent)) {

                    // Check ! C Wallet 
                        $checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($partent['customer_id']);
                        if (intval($checkC_Wallet['number']) === 0) {
                            if (!$this -> model_account_customer -> insertC_Wallet($partent['customer_id'])) {
                                die();
                            }
                        }

                        if (intval($partent['active_tree']) === 1) {

                            $this->commission_Parrent($invoice['customer_id'], $amountPD, $invoice['transfer_id']);
                        }
                   }
        }
    }
    public function commission_Parrent($customer_id, $amountPD, $transfer_id){

        $customer = $this -> model_account_customer ->getCustomer($customer_id);
                
        $partent = $this -> model_account_customer ->getCustomer($customer['p_node']);

            // check Package Parrent = 1
            if (intval($partent['package']) === 1) {
                $rows =  $this -> model_account_customer ->getPNode($partent['customer_id']);
                if(count($rows) <= 3){
                    $price = $amountPD;
                    switch ($price) {
                        case 300000000:
                            $percent = 0.1;
                            break;
                        case 700000000:
                             $percent = 0.1;
                            break;
                        case 1000000000:
                             $percent = 0.1;
                            break;
                        case 2000000000:
                             $percent = 0.15;
                            break;
                       
                    }
                    $price=$price*$percent;
                    $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor ".($percent*100)."% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
                }
                if(count($rows) >= 4 && count($rows) <= 6){
                    $price = $amountPD;
                    switch ($price) {
                        case 300000000:
                            $percent = 0.1;
                            break;
                        case 700000000:
                             $percent = 0.15;
                            break;
                        case 1000000000:
                             $percent = 0.18;
                            break;
                        case 2000000000:
                             $percent = 0.2;
                            break;
                       
                    }
                    $price= $price*$percent;
                    $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor ".($percent*100)."% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
                }
                if(count($rows) >= 7){
                    $price = $amountPD;
                    switch ($price) {
                        case 300000000:
                            $percent = 0.18;
                            break;
                        case 700000000:
                             $percent = 0.2;
                            break;
                        case 1000000000:
                             $percent = 0.22;
                            break;
                        case 2000000000:
                             $percent = 0.24;
                            break;
                       
                    }
                    $price= $price*$percent;
                    $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor ".($percent*100)."% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
                }
            }
            // check Package Parrent = 2
            if (intval($partent['package']) === 2) {
                $rows =  $this -> model_account_customer ->getPNode($partent['customer_id']);
                if(count($rows) <= 2){
                    $price = $amountPD;
                    $price=$price*0.1;
                    $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor 10% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
                }
                if(count($rows) >= 3 && count($rows) <= 4){
                    $price = $amountPD;
                    $price=$price*0.15;
                    $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor 15% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
                }
                if(count($rows) >= 5){
                    $price = $amountPD;
                    $price=$price*0.2;
                    $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                    $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor 20% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
                }
            }
            // check Package Parrent = 3
            if (intval($partent['package']) === 3) {
                $price = $amountPD;
                switch ($price) {
                    case 300000000:
                        $percent = 0.1;
                        break;
                    case 700000000:
                         $percent = 0.15;
                        break;
                    case 1000000000:
                         $percent = 0.18;
                        break;
                    case 2000000000:
                         $percent = 0.22;
                        break;
                   
                }
               $price= $price*$percent;
                $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor ".($percent*100)."% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
            }
            // check Package Parrent = 4
            if (intval($partent['package']) === 4) {
                $price = $amountPD;
                switch ($price) {
                    case 300000000:
                        $percent = 0.15;
                        break;
                    case 700000000:
                         $percent = 0.18;
                        break;
                    case 1000000000:
                         $percent = 0.20;
                        break;
                    case 2000000000:
                         $percent = 0.24;
                        break;
                   
                }
                $price= $price*$percent;
                $this -> model_account_auto -> update_C_Wallet($price, $partent['customer_id']);
                $this -> model_account_customer -> saveTranstionHistory($partent['customer_id'], 'C-wallet', '+ ' . ($price/100000000) . ' BTC', "Sponsor ".($percent*100)."% for ".$customer['username']." finish Package " . $transfer_id." (".($amountPD/100000000)." BTC))");   
            }
       
    }
    public function detail_payment(){

       $this->load->model('account/pd');
        $invoice = $this->model_account_pd->getInvoceFormHash($this->request->get['invoice_hash'], $this->session->data['customer_id']);
       
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
        $html .= '<p>Transfer Code: <code>'.$invoice["transfer_id"].'</code></p>';
        $html .= '<p>Total: <code>'.(intval($invoice["amount"]) / 100000000).' <i class="fa fa-btc" aria-hidden="true"></i></code></p>';
        $html .= '<p>Received: <code>'.(intval($invoice["received"]) / 100000000).' <i class="fa fa-btc" aria-hidden="true"></i></code></p>';
        $html .= '<p>Status: <span class="'.$label.'">'.$info.'</span></p>';
        $html .= '<p>Wallet: <code>'.$invoice["input_address"].'</code></p>';
        $json['html'] = $html;
        $html = null;
        $this -> response -> setOutput(json_encode($json));
    }
    // Crontab
}
