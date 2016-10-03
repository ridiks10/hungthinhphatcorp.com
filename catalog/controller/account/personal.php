<?php
class ControllerAccountPersonal extends Controller {
	private $error = array();

	public function index() {
		if (!$this -> customer -> isLogged()) {
			$this -> session -> data['redirect'] = $this -> url -> link('account/personal', '', 'SSL');

			$this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		}

		$this->document->addScript('catalog/view/javascript/personal/tree.min.js');
		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}
		$this -> load -> language('account/personal');
		$this -> load -> model('account/customer');
		// $active_tree = $this -> getActive_tree();
		// intval($active_tree) === 0 && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		$data['base'] = $server;

		
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$language = new Language($getLanguage);
		$language -> load('account/personal');
		$data['lang'] = $language -> data;

		$this -> document -> setTitle($data['lang']['heading_title']);

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('text_home'), 'href' => $this -> url -> link('common/home'));

		$data['breadcrumbs'][] = array('text' => $this -> language -> get('heading_title'), 'href' => $this -> url -> link('account/personal', '', 'SSL'));

		$data['heading_title'] = $this -> language -> get('heading_title');

		$data['column_left'] = $this -> load -> controller('common/column_left');
		$data['column_right'] = $this -> load -> controller('common/column_right');
		$data['content_top'] = $this -> load -> controller('common/content_top');
		$data['content_bottom'] = $this -> load -> controller('common/content_bottom');
		$data['footer'] = $this -> load -> controller('common/footer');
		$data['header'] = $this -> load -> controller('common/header');
		$data['idCustomer'] = $this -> customer -> getId();


		$id_user = $data['idCustomer'];
		$user = $this -> model_account_customer -> getCustomer($id_user);

		$data['nameCustomer'] = $this -> customer -> getFirstname();
		$data['telephone'] = $this -> customer -> getTelephone();
		// $data['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		// $data['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		// //$data['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		// echo "<pre>"; print_r($data['floor']); echo "</pre>"; die();
		// die('111231');$data['total'] = $data['total_left'] + $data['total_right'];
		$data['self'] = $this ;
	

		//=============================Refferal=======================
		$customer = $this -> model_account_customer-> getCustomer($this -> session -> data['customer_id']);

		$Hash = $customer['customer_code'];	
		
		$data['customer_code'] = $Hash;

		$customer = $customer['username'];	
		$data['username'] = $customer;

		$data['self'] = $this;
		$customer = null;

		//$data['customerChild'] = $this -> model_account_customer-> getParentByIdCustomer($this -> session -> data['customer_id']);
		
		//$total = $this -> model_account_customer-> getCountTreeCustom($this -> session -> data['customer_id']);
$data['trees'] =  HTTPS_SERVER . 'index.php?route=account/personal/get_BinaryTree';
		
		//==============================================================

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/personal.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/personal.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/personal.tpl', $data));
		}
	}
	public function getActive_tree(){
		$this->load->model('account/customer');
		$status_ml = $this -> model_account_customer ->getActive_tree();
		if (!empty($status_ml)) {
			$active_tree = $status_ml['active_tree'];
		}
		
		return $active_tree;
	}
	public function get_status_ml(){
		$this->load->model('account/customer');
		$status_ml = $this -> model_account_customer ->get_status_ml();
		if (!empty($status_ml)) {
			$status_ml = $status_ml['status'];
		}
		
		return $status_ml;
	}
	public function get_customer_in_ml(){
		$this->load->model('customize/register');
		$customerML = $this -> model_customize_register -> get_customer_ml_by_customer_id($this -> session -> data['customer_id']);
		$customerML = intval(count($customerML)) > 0 ? 1 : 2;
		
		return $customerML;
	}

	

	public function checkBinaryLeft($p_binary, $postion){

		$this -> load -> model('account/customer');
		if ($postion=='left') {
			$Binary = $this -> model_account_customer -> checkBinaryLeft($p_binary);
			if (!empty($Binary)) {
				$checkLeft = intval($Binary['left']);
				return $checkLeft === 0 ? 1 : 2;
			}
			else{
				return 1;
			}
				
				//return $checkLeft = 1;			
		}
		if ($postion=='right') {
			$Binary = $this -> model_account_customer -> checkBinaryRight($p_binary);	
			if (!empty($Binary)) {
				$checkRight = intval($Binary['right']);
			 	return $checkRight === 0 ? 1 : 2;
			} else {
				return 1;
			}
		}
		
	}
	public function checkBinaryRight($p_binary){
		$this -> load -> model('account/customer');
		$Binary = $this -> model_account_customer -> checkBinaryRight($p_binary);
		$CountBinary = count($Binary);
		if ($CountBinary > 0) {
			$checkRight = intval($Binary['right']);
		return $checkRight === 0 ? 1 : 2;
		}
		
	}
	public function checkBinary($p_binary){
		$this -> load -> model('account/customer');
		$binary = $this -> model_account_customer -> checkBinary($p_binary);
		$checkbinary = count($binary);
		return $checkbinary === 0 ? 2 : 1;
	}
	public function add_customer (){

			$this -> load -> model('account/customer');
			$this -> document -> addScript('catalog/view/javascript/register/register.js');
		//language
		
	
		//method to call function
		
		! array_key_exists('code', $this -> request -> get) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));

		$code = $this -> model_account_customer -> get_code($this -> request -> get['code']);
		empty($code) && $this -> response -> redirect($this -> url -> link('home/page/register#error', '', 'SSL'));

		//start load country model
		$this -> load -> model('customize/country');
		if ($this->request->server['HTTPS']) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		$data['base'] = $server;

		$data['country'] = $this -> model_customize_country -> getCountry();
		//end load country model

		//data render website
		$data['self'] = $this;

		//error validate
		$data['error'] = $this -> error;
		$data['getaccount'] = $this->url->link('account/personal/getaccount', '', 'SSL');
		$data['check_p_binary'] = $this->url->link('account/personal/get_position', '', 'SSL');
		$data['country'] = $this -> model_customize_country -> getCountry();
		$data['action'] = $this -> url -> link('account/personal/register_submit', 'token=' . $this -> request -> get['code'], 'SSL');
		$data['actionCheckUser'] = $this -> url -> link('account/registers/checkuser', '', 'SSL');
		$data['actionCheckEmail'] = $this -> url -> link('account/registers/checkemail', '', 'SSL');
		$data['actionCheckPhone'] = $this -> url -> link('account/registers/checkphone', '', 'SSL');
		$data['actionCheckCmnd'] = $this -> url -> link('account/registers/checkcmnd', '', 'SSL');
		// $data['column_left'] = $this->load->controller('common/column_left');

		// $data['footer'] = $this -> load -> controller('common/footer');
		// $data['header'] = $this -> load -> controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/registers.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/registers.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/registers.tpl', $data));
		}

	}
	public function getaccount() {
		if ($this -> request -> post['keyword']) {
			$this -> load -> model('account/customer');
			$tree = $this -> model_account_customer -> getCustomLikes($this -> request -> post['keyword']);
			
			if (count($tree) > 0) {
				foreach ($tree as $value) {
					 echo '<li class="list-group-item" onClick="selectU(' . "'" . $value['name'] . "'" . ');">' . $value['name'] . '</li>';
				}
			}
		}
	}
public function get_position($p_binary){
		$this -> load -> model('account/customer');
		$p_binary = $this -> request -> get['p_binary'];
		$check_pbinary = $this -> model_account_customer ->get_customer_Id_by_username($p_binary);

		$check_p_binary = $this -> model_account_customer -> count_p_binary($check_pbinary['customer_id']);
		if (!empty($check_p_binary)) {
			$html ='';
			if (intval($check_p_binary['left']) === 0 && intval($check_p_binary['right']) === 0 ) {
				$html .= '<option value="">Chọn vị trí</option>';
	            $html .= '<option value="left">Trái</option>';
	            $html .= '<option value="right">Phải</option>';
			} elseif (intval($check_p_binary['left']) === 0 && intval($check_p_binary['right']) !== 0 ) {
				$html .= '<option value="">Chọn vị trí</option>';
	            $html .= '<option value="left">Trái</option>';
	            
			} elseif (intval($check_p_binary['left']) !== 0 && intval($check_p_binary['right']) === 0 ) {
				$html .= '<option value="">Chọn vị trí</option>';
	            $html .= '<option value="right">Phải</option>';
			}
			$json['html'] = $html;

			
		} else{
			$json['html'] = null;
		}
		$this -> response -> setOutput(json_encode($json));
		
	}
	
	public function register_submit(){

		$this->load->model('account/register');
		$this->load->model('account/customer');
		$code = $this -> model_account_customer -> get_code($this -> request -> get['token']);
		empty($code) && $this -> response -> redirect($this -> url -> link('home/page/register#error', '', 'SSL'));
		if ($this->request->server['REQUEST_METHOD'] === 'POST'){

			$code = $this -> model_account_customer -> get_code($this -> request -> post['code']);

			$check_pnode = $this -> model_account_register ->get_customer_Id_by_username($this->request->post['p_node']);
			$check_pbinary = $this -> model_account_register ->get_customer_Id_by_username($this->request->post['p_binary']);
			$check_p_binary = $this -> model_account_register -> check_p_binary($this->request->post['p_binary']);
			
			if (intval(count($check_pnode)) === 1 && intval(count($check_pbinary)) === 1 && intval($check_p_binary['number']) != 2) {

				$tmp = $this -> model_account_register -> addCustomer_custom($this->request->post, $code['package']);
				$this -> model_account_customer -> update_code($this -> request -> get['token']);
				$cus_id= (int)$tmp['customer_id'];
				$pass = $tmp['pass'];
				$username = substr(hexdec(crc32(md5($cus_id))),0, 7);
				$this -> model_account_register -> update_username_customer($cus_id, $username);

				$amount = 0;
				
				$checkC_Wallet = $this -> model_account_register -> checkC_Wallet($cus_id);
				if(intval($checkC_Wallet['number'])  === 0){
					if(!$this -> model_account_register -> insertC_Wallet($cus_id)){
						die();
					}
				}
				
				$checkR_Wallet = $this -> model_account_register -> checkR_Wallet($cus_id);
				if(intval($checkC_Wallet['number'])  === 0){
					if(!$this -> model_account_register -> insertR_Wallet($cus_id)){
						die();
					}
				}
				$checkM_Wallet = $this -> model_account_register -> checkM_Wallet($cus_id);
				if(intval($checkM_Wallet['number'])  === 0){
					if(!$this -> model_account_register -> insertM_Wallet($cus_id)){
						die();
					}
				}
				$checkCN_Wallet = $this -> model_account_register -> checkCN_Wallet($cus_id);
				if(intval($checkCN_Wallet['number'])  === 0){
					if(!$this -> model_account_register -> insertCN_Wallet($cus_id)){
						die();
					}
				}
				$checkCH_Wallet = $this -> model_account_register -> checkCH_Wallet($cus_id);
				if(intval($checkCH_Wallet['number'])  === 0){
					if(!$this -> model_account_register -> insertCH_Wallet($cus_id)){
						die();
					}
				}
				$checkTT_Wallet = $this -> model_account_register -> checkTT_Wallet($cus_id);
				if(intval($checkTT_Wallet['number'])  === 0){
					if(!$this -> model_account_register -> insertTT_Wallet($cus_id)){
						die();
					}
				}

				// lãi trực tiếp
				/*$check_show_pnode = $this -> model_account_register ->check_show_pnode($cus_id);
				// lấy số tiền đầu tư
				$show_pd_customer = $this -> model_account_register -> show_pd_customer($check_show_pnode['p_node']);
				$show_pd_customer['filled'];*/


				
				
				//Update thuong quan ly
				$this -> createInvestment($cus_id, $code['package']);

				$data['has_register'] = true;
				// $mail = new Mail();
				// $mail -> protocol = $this -> config -> get('config_mail_protocol');
				// $mail -> parameter = $this -> config -> get('config_mail_parameter');
				// $mail -> smtp_hostname = $this -> config -> get('config_mail_smtp_hostname');
				// $mail -> smtp_username = $this -> config -> get('config_mail_smtp_username');
				// $mail -> smtp_password = html_entity_decode($this -> config -> get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
				// $mail -> smtp_port = $this -> config -> get('config_mail_smtp_port');
				// $mail -> smtp_timeout = $this -> config -> get('config_mail_smtp_timeout');

				// $mail -> setTo($this -> request -> post['email']);
				// $mail -> setFrom($this -> config -> get('config_email'));
				// $mail -> setSender(html_entity_decode("Công Ty TNHH SX TM VẬN ẢI BIÊỂN HƯNG THỊNH PHÁT", ENT_QUOTES, 'UTF-8'));
				// $mail -> setSubject("Công Ty TNHH SX TM VẬN ẢI BIÊỂN HƯNG THỊNH PHÁT - TÀI KHOẢN CỦA BẠN ĐÃ TẠO THÀNH CÔNG!");
				// $mail -> setHtml('
				// 	<h1><span style="font-size:12px">CHÚC MỪNG TÀI KHOẢNC CỦA BẠN ĐÃ TẠO THÀNH CÔNG!</span></h1>
				// 	<p><span style="font-size:12px"><strong>What is Next?</strong></span></p>
				// 	<p><span style="font-size:12px">Bây giời bạn có thể &nbsp;<a href="' . $this -> url -> link("account/login", "", "SSL") . '" style="color:rgb(0,72,153);background:transparent" target="_blank">Đăng nhập</a> Sử dụng tên đăng nhập&nbsp;<strong> và&nbsp;</strong><strong>mật khẩu</strong>, và  bắt đầu ử dụng website.</span></p>
				// 	<p><span style="font-size:12px">&nbsp;<a href="' . HTTPS_SERVER . '" target="_blank">http://hungthinhphatcorp.com/</a></span></p>
				// 	<p><span style="font-size:12px">-  Họ Tên : ' . $this -> request -> post["firstname"] . '</span></p>
				// 	<p><span style="font-size:12px">-  Địa chỉ : ' . $this -> request -> post["address"] . '</span></p>
				// 	<p><span style="font-size:12px">-  Mã đăng nhập : ' . $username . '</span></p>
				// 	<p><span style="font-size:12px">- Mật khẩu : ' . $this -> request -> post["password"] . '</span></p>
					
				// 	<p><span style="font-size:12px"><span style="font-family:arial,helvetica,sans-serif">If you have any questions, feel free to contact us by using our support center in the adress belov</span></span></p>
				// 	<p><strong><span style="font-size:12px">HTP support team!</span></strong></p>
				// ');
				
				// $mail -> send();
				// $phone = $this -> request -> post["telephone"];
				// $password = "admin123";
				// $content = "CÔNG TY TNHH TM SX VẬN TẢI BIỂN HƯNG THỊNH PHÁT
				//  	Username : ".$username."
				//  	Password : ".$pass."
				//  ";
				//$this -> sms($phone,$content);
				
				$this -> session -> data['success'] = $this -> language -> get('Create account success!');
				

				//$this->response->redirect($this->url->link('pd/register', 'token=' . $this->session->data['token'], 'SSL'));
			
					
					$this->update_C_wallet($cus_id);
					$p_binary = $this -> model_account_register -> get_customer_Id_by_username($this->request->post['p_binary']);
					$p_binary= $p_binary['customer_id'];
					$this -> get_customer_by_binary($cus_id, $p_binary);
				
				

				$hash = "#".$username."-".number_format($code['package'])."";
			$this -> response -> redirect($this -> url -> link('home/page/register', $hash, 'SSL'));
			} else{
				$this -> response -> redirect($this -> url -> link('home/page/register#errors', '', 'SSL'));
			}

			
		}
		
	}
	public function sms($phone,$content){

	$this->sendSMS([''.$phone.''], ''.$content.'');
	}
public function getUserInfo() {
    $sms = new SpeedSMSAPI();
    $userInfo = $sms->getUserInfo();
    var_dump($userInfo);
	}	

public function sendSMS($phones, $content) {
    $sms = new SpeedSMSAPI();
    $return = $sms->sendSMS($phones, $content, SpeedSMSAPI::SMS_TYPE_CSKH, "", 1);
    var_dump($return);
}
	public function send_sms($phone_send,$content){
		$APIKey="70152DEE3829626055A11C11E1F766";
		$SecretKey="86CF68BD01032D2E48DD90FDE471D8";
		$YourPhone = $phone_send;
		$content = $content;
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
	//=== Tai==
	public function get_customer_by_binary($customer_id, $p_binary){
		$this->load->model('account/register');

		// $p_binary = $this -> model_account_register -> get_p_binary_by_customer_id($customer_id);
		$customer = $this -> model_account_register -> getCustomerCustom($customer_id);
		
		$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($p_binary);

		$per_comission = 100000;
		//Tang 1
		if (intval(count($customer_p_binary)) > 0) {

			$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
			$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");

			//Tang 2
			$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
				
			if (intval(count($customer_p_binary)) > 0) {
				$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
				$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
				
				//Tang 3
				$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
				if (intval(count($customer_p_binary)) > 0) {
					$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
					$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
					
					//Tang 4
					$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
					if (intval(count($customer_p_binary)) > 0) {
						$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
						$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
						
						//Tang 5
						$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
						if (intval(count($customer_p_binary)) > 0) {
							$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
							$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
							
							//Tang 6
							$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
							if (intval(count($customer_p_binary)) > 0 && intval($customer['package']) > 5000000) {
								$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
								$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
								
								//Tang 7
								$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
								if (intval(count($customer_p_binary)) > 0) {
									$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
									$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
									
									//Tang 8
									$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
									if (intval(count($customer_p_binary)) > 0 && intval($customer['package']) >= 20000000) {
										$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
										$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
										
										//Tang 9
										$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
										if (intval(count($customer_p_binary)) > 0 && intval($customer['package']) >= 50000000) {
											$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
											$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
											
											//Tang 10
											$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
											if (intval(count($customer_p_binary)) > 0 && intval($customer['package']) >= 100000000) {
												$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
												$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
												
												//Tang 11
												$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
												if (intval(count($customer_p_binary)) > 0 && intval($customer['package']) >= 500000000) {
													$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
													$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
													
													//Tang 12
													$customer_p_binary = $this -> model_account_register -> get_customer_by_binary($customer_p_binary['p_binary']);
													if (intval(count($customer_p_binary)) > 0 && intval($customer['package']) >= 1000000000) {
														$this -> model_account_register -> update_CH_Wallet($per_comission, $customer_p_binary['customer_id']);
														$this -> model_account_register -> saveTranstionHistory($customer_p_binary['customer_id'], 'Cộng hưởng', '+ 100,000 VND', "Thưởng Quản Lý từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}
		
	}
	//= End
	public function createInvestment($customer_id, $amount){
		$this->load->model('account/register');
		$pd_query = $this -> model_account_register -> createPD($customer_id, $amount);
	}

	public function update_C_wallet($customer_id){
		$this->load->model('account/register');
		$customer = $this -> model_account_register -> getCustomerCustom($customer_id);

        $partent = $this -> model_account_register -> getCustomerCustom($customer['p_node']);
        $investment_parrent = $this -> model_account_register -> get_filled_by_id($partent['customer_id']);

    	if (intval($investment_parrent['sum_filled']) <= intval($customer['package'])) {
    		switch (intval($investment_parrent['sum_filled'])) {
	    		case 5000000:
	    			$per = 10;
	    			break;
	    		case 20000000:
	    			$per = 15;
	    			break;
	    		case 50000000:
	    			$per = 18;
	    			break;
	    		case 100000000:
	    			$per = 20;
	    			break;
	    		case 500000000:
	    			$per = 25;
	    			break;
	    		case 1000000000:
	    			$per = 32;
	    			break;
    		}
    	
    		$price = (intval($customer['package']) * $per) / 100;
    	} else{
    		switch (intval($customer['package'])) {
	    		case 5000000:
	    			$per = 10;
	    			break;
	    		case 20000000:
	    			$per = 15;
	    			break;
	    		case 50000000:
	    			$per = 18;
	    			break;
	    		case 100000000:
	    			$per = 20;
	    			break;
	    		case 500000000:
	    			$per = 25;
	    			break;
	    		case 1000000000:
	    			$per = 32;
	    			break;
    		}
    		$price = (intval($customer['package']) * $per) / 100;
    	}
    	
		$double = intval($investment_parrent['sum_filled'])*2;

		if ($price > $double) {
			$per_comission = $double;
		}else {
			$per_comission = $price;
		}
		

		$this -> model_account_register -> update_C_Wallet($per_comission, $partent['customer_id']);
		$this -> model_account_register -> saveTranstionHistory($partent['customer_id'], 'Ví Hoa hồng', '+ ' . number_format($per_comission) . ' VND', "Thưởng trực tiếp ".$per." % từ thành viên ".$customer['username']."-".$customer['firstname']." đầu tư gói  (".number_format($customer['package'])." VND)");
		$this -> update_vnd_binary($customer_id, $customer['package']);
	}
	public function update_vnd_binary($customer_id, $amount){
		$this->load->model('account/register');
		$customer_ml = $this -> model_account_register -> getTableCustomerMLByUsername($customer_id);
		$customer = $this -> model_account_register -> getCustomerCustom($customer_id);	
			$customer_first = true ;
			if(intval($customer_ml['p_binary']) !== 0){
				while (true) {
					//lay thang cha trong ban Ml
					$customer_ml_p_binary = $this -> model_account_register -> getTableCustomerMLByUsername($customer_ml['p_binary']);

					if($customer_first){
						//kiem tra la customer dau tien vi day la gia tri callback mac dinh
						if(intval($customer_ml_p_binary['left']) === intval($customer_id))  {
							//nhanh trai
							$this -> model_account_register -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount );
							$this -> model_account_register -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Doanh thu nhánh trái', '+ ' . number_format($amount) . ' VNĐ', "từ thành viên tuyến dưới ".$customer['username']."-".$customer['firstname']." đầu tư gói (".number_format($amount)." VNĐ)");
						}else{
							//nhanh phai
							$this -> model_account_register -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount );
							$this -> model_account_register -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Doanh thu nhánh phải', '+ ' . number_format($amount) . ' VNĐ', "từ thành viên tuyến dưới ".$customer['username']."-".$customer['firstname']." đầu tư gói (".number_format($amount)." VNĐ)");
						}
						$customer_first = false;
					}else{
			
						if(intval($customer_ml_p_binary['left']) === intval($customer_ml['customer_id']) ) {
							//nhanh trai
							$this -> model_account_register -> update_pd_binary(true, $customer_ml_p_binary['customer_id'], $amount );
							$this -> model_account_register -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Doanh thu nhánh trái', '+ ' . number_format($amount) . ' VNĐ', "từ thành viên tuyến dưới ".$customer['username']."-".$customer['firstname']." đầu tư gói (".number_format($amount)." VNĐ)");
							
						}else{
							//nhanh phai
							$this -> model_account_register -> update_pd_binary(false, $customer_ml_p_binary['customer_id'], $amount );
							$this -> model_account_register -> saveTranstionHistory($customer_ml_p_binary['customer_id'], 'Doanh thu nhánh phải', '+ ' . number_format($amount) . ' VNĐ', "từ thành viên tuyến dưới ".$customer['username']."-".$customer['firstname']." đầu tư gói (".number_format($amount)." VNĐ)");
						}
					}
					
					

					if(intval($customer_ml_p_binary['customer_id']) === 1){
						break;
					}
					//lay tiep customer de chay len tren lay thang cha
					$customer_ml = $this -> model_account_register -> getTableCustomerMLByUsername($customer_ml_p_binary['customer_id']);

				} 
			}
	}
	public function prints(){
		$cus_id = $this->request->get['id_customer'];
		$data['pass'] = $this->request->get['pass'];
		$this->load->model('account/register');
		$data['info_customer'] = $this -> model_account_register -> get_customer_print($cus_id);
		$data['self'] = $this;
		$data['token'] = $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('pd/print.tpl', $data));
	}
	public function get_username($customer_id){
		$this->load->model('account/register');
		$username = $this -> model_account_register -> get_username_by_id($customer_id);
		
		return $username['username'];

	}

	public function getInfoUser(){

		$id = $this->request->get['id'];
		
		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);

		$user['total_left'] =  $this -> model_account_customer ->  getSumLeft($id);	

		$user['total_right'] =  $this -> model_account_customer ->  getSumRight($id);
		
		$user['floor'] =  $this -> model_account_customer -> getSumFloor($id);
		
		$user['total'] = $user['total_left'] + $user['total_right'];

		echo json_encode($user);

		exit();

	}

	public function getInfoCustomer() {
		$id_user = $this -> request -> get['id_user'];

		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomer($id_user);
		$json = array();
		$json['nameCustomer'] = $user['firstname'];
		$json['telephone'] = $user['telephone'];
		$json['total_left'] = $this -> model_account_customer -> getSumLeft($id_user);
		$json['total_right'] = $this -> model_account_customer -> getSumRight($id_user);
		$json['floor'] = $this -> model_account_customer -> getSumFloor($id_user);
		$json['total'] = $json['total_left'] + $json['total_right'];
		$this -> response -> addHeader('Content-Type: application/json');
		$this -> response -> setOutput(json_encode($json));
		
	}

	public function getJsonBinaryTree_Admin($id=0){

		$this -> load -> model('account/customer');
		
		$id = $this->request->get['id_user'];
		//$id = $this->session->data['customer_id'];

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);



		$node = new stdClass();


		$node->id = $id;
		
		$node->text = $user['username'] ;

		$node->username = $user['username'] ;
		$node -> email = $user['email'];
		$node -> telephone = $user['telephone'];
		$node -> date_added = $user['date_added'];
		$node -> level = $user['level'];
		$node-> level_user = $user["level_member"];
		$node -> status_ml = $user['status_ml'];
		$node -> empty = false;

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		if($user['status'] == 0){
			$node->iconCls = "level4";
		}else if($monthNow == $month && $yearNow == $year){
			$node->iconCls = "level2";
		}else{
			$node->iconCls = "level3";
		}

		$node->fl = 1;

		$this->getBinaryChild_binary($node);

		$node = array($node);

	//	ob_clean();
		echo json_encode($node);

		exit();

	}

	public function getBinaryChild_binary(&$node){

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this -> load -> model('account/customer');
		$left_row = $this -> model_account_customer ->getLeftO($node->id);
		
		// print_r($left_row);
		// die();
			$left = new stdClass();
		
		    foreach ($left_row as $key => $value) {
		        $left->$key = $value;
		    } 
			
			$node->children = array();

			if(isset($left_row["id"])){

				$left->fl = $node->fl +1;
				$left -> empty = false;
				if($left->fl<5)
				{
					$this->getBinaryChild_binary($left);
				}


				else $left->children = 1;
				
				array_push($node->children , $left);			

			}else{
				$left->fl = $node->fl +1;
				$left -> p_binary = $node -> id;
				$left -> empty = true;
				$left -> iconCls = 'level1 left';
				$left -> id =  "-1";
				array_push($node->children , $left);
			}
		

		$right_row = $this -> model_account_customer ->getRightO($node->id);
		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;

			$right -> empty = false;
			if($right->fl<5)

				$this->getBinaryChild_binary($right);

			else $right->children = 1;

			array_push($node->children , $right);
		}else{
			$right->fl = $node->fl +1;
			$right -> empty = true;
			$right -> p_binary = $node -> id;
			$right -> iconCls = 'level1 right';
			$right -> id =  -1;
			array_push($node->children , $right);
		}
		

		if(count($node->children) ==0) $node->children = 0;

		return;

	}
	public function get_BinaryTree(){

		$this -> load -> model('account/customer');
		
		// $id = $this->request->get['id_user'];
		$id = $this->session->data['customer_id'];

		$user = $this -> model_account_customer -> getInfoUsers_binary($id);



		$node = new stdClass();


		$node->id = $id;
		
		// $node->text = $user['username'] ;

		$node->name = $user['username'] ;
		$node ->account_holder = $user['account_holder'];
		// $node -> telephone = $user['telephone'];
		// $node -> date_added = $user['date_added'];
		$node -> level = $user['level'];
		// $node-> level_user = $user["level_member"];
		switch (intval($user['level'])) {
			case '1':
				$type = 'green';
				break;
			
			case '2':
				$type = 'green';
				break;
			default:
				$type = 'green';
				break;
			
		}
		$node-> type = $type;
		// $node -> status_ml = $user['status_ml'];
		

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		$date_added = strtotime($user['date_added']);
		$month = date('m',$date_added);
		$year = date('Y',$date_added);
		
		// if($user['status'] == 0){
		// 	$node->iconCls = "level4";
		// }else if($monthNow == $month && $yearNow == $year){
		// 	$node->iconCls = "level2";
		// }else{
		// 	$node->iconCls = "level3";
		// }

		$node->fl = 1;

		$this->get_BinaryChildTree($node);

		$node = array($node);

	//	ob_clean();
		echo json_encode($node[0]);

		exit();

	}
	public function get_BinaryChildTree(&$node){

		$date = strtotime(date('Y-m-d'));
		$monthNow = date('m',$date);
		$yearNow = date('Y',$date);
		
		$this -> load -> model('account/customer');
		$left_row = $this -> model_account_customer ->getLeftO($node->id);
		
		// print_r($left_row);
		// die();
			$left = new stdClass();
		
		    foreach ($left_row as $key => $value) {
		    	
		        $left->$key = $value;
		    } 
			
			$node->children = array();

			if(isset($left_row["id"])){

				$left->fl = $node->fl +1;
				$left -> position ='left';
				$lv = $node->level;
// switch (intval($lv)) {
// 			case '1':
// 				$type = 'darkturquoise';
// 				break;
			
// 			case '2':
// 				$type = 'red';
// 				break;
// 			default:
// 				$type = 'green';
// 				break;
			
// 		}
		$left-> type = 'green';
				$left -> empty = false;
				
					$this->get_BinaryChildTree($left);
				
				
				array_push($node->children , $left);			

			}
		

		$right_row = $this -> model_account_customer ->getRightO($node->id);
		$right = new stdClass();
	    foreach ($right_row as $key => $value) {
	        $right->$key = $value;
	    } 
		
		if(isset($right_row["id"])){

			$right->fl = $node->fl +1;
			$right -> position ='right';
$lv = $node->level;
// switch (intval($lv)) {
// 			case '1':
// 				$type = 'darkturquoise';
// 				break;
			
// 			case '2':
// 				$type = 'red';
// 				break;
// 			default:
// 				$type = 'green';
// 				break;
			
// 		}
		$right-> type = 'green';

			$right -> empty = false;
			
				$this->get_BinaryChildTree($right);

			

			array_push($node->children , $right);
		}
		

		if(count($node->children) ==0) $node->children = 0;

		return;

	}

	public function getJsonBinaryTree() {

		//$id_user = $this -> request -> get['id_user'];
$id_user = $this->session->data['customer_id'];
		$this -> load -> model('account/customer');

		$user = $this -> model_account_customer -> getCustomerCustom($id_user);

		$node = new stdClass();

		$node -> id = $user['customer_id'];

		$node -> text = $user['username'] ;

		$node -> iconCls = intval($user['level']) === 1 ? "level1" : "level2";
		

		$this -> getBinaryChild($node);

		$node = array($node);


		echo json_encode($node[0]);
		echo "<pre>"; print_r(json_encode($node[0])); echo "</pre>"; die();

		exit();

	}

	public function getBinaryChild(&$node) {

		$this -> load -> model('account/customer');

		$listChild = $this -> model_account_customer -> getListChild($node -> id);

		$node -> children = array();

		foreach ($listChild as $child) {
			$childNode = new stdClass();

			$childNode -> id = $child['customer_id'];

			$childNode -> text = $child['username'];

			$childNode -> iconCls = intval($child['level']) === 1 ? "level1" : "level2";
			array_push($node -> children, $childNode);

			$this -> getBinaryChild($childNode);

		}
		if (count($node -> children) === 0)
			$node -> children = 0;
		return;

	}

}
