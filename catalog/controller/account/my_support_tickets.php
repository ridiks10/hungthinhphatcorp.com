<?php
class ControllerAccountMysupporttickets extends Controller {

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
		$language -> load('account/gd');
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
        $pagination->url       = $this->url->link('account/pd', 'page={page}', 'SSL');
        
        $data['pds']        = $this->model_account_customer->getPDById($this->session->data['customer_id'], $limit, $start);
        $data['pagination'] = $pagination->render();
      
		$server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
		$data['base'] = $server;
		$data['self'] = $this;

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/my_support_tickets.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/my_support_tickets.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/my_support_tickets.tpl', $data));
		}
	}

    public function submit_a_ticket() {
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
        $language -> load('account/gd');
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
        $pagination->url       = $this->url->link('account/pd', 'page={page}', 'SSL');
        
        $data['pds']        = $this->model_account_customer->getPDById($this->session->data['customer_id'], $limit, $start);
        $data['pagination'] = $pagination->render();
      
        $server = $this -> request -> server['HTTPS'] ? $server = $this -> config -> get('config_ssl') : $server = $this -> config -> get('config_url');
        $data['base'] = $server;
        $data['self'] = $this;

        if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/submit_a_ticket.tpl')) {
            $this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/submit_a_ticket.tpl', $data));
        } else {
            $this -> response -> setOutput($this -> load -> view('default/template/account/submit_a_ticket.tpl', $data));
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
