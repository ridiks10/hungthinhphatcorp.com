<?php
class ControllerAccountDashboard extends Controller {

	public function index() {

		// $mail = new Mail();
		// $mail->protocol = $this->config->get('config_mail_protocol');
		// $mail->parameter = $this->config->get('config_mail_parameter');
		// $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		// $mail->smtp_username = $this->config->get('config_mail_smtp_username');
		// $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		// $mail->smtp_port = $this->config->get('config_mail_smtp_port');
		// $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		// $mail->setTo('phucnguyen@icsc.vn');
		// $mail->setFrom($this->config->get('config_email'));
		// $mail->setSender(html_entity_decode("test test", ENT_QUOTES, 'UTF-8'));
		// $mail->setSubject("asd11111111fssd");
		// $mail->setText("fddsasfsffsds");
		// $mail->send();

		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/dashboard/dashboard.js');
			$self -> document -> addScript('catalog/view/javascript/jquery.marquee.js');
			$self -> document -> addScript('catalog/view/javascript/countdown/jquery.countdown.min.js');
			$self -> load -> model('simple_blog/article');
		};
		

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/dashboard');
		
		$data['lang'] = $language -> data;
		$checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($this -> session -> data['customer_id']);
		if(intval($checkM_Wallet['number'])  === 0){
			if(!$this -> model_account_customer -> insert_M_Wallet($this -> session -> data['customer_id'])){
				die();
			}
		}
		$data['getall_user'] = $this->model_account_customer->getall_user_new();
		$data['customer'] = $this -> model_account_customer -> getAllCustomer();
		
		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		//data render website
		//start load country model

		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;
		$data['self'] = $this;
		$data['regulations'] = $this -> config -> get('config_regulations');
		$data['regulations1'] = $this -> config -> get('config_regulations_1');
		$data['regulations2'] = $this -> config -> get('config_regulations_2');
		$data['regulations3'] = $this -> config -> get('config_regulations_3');
		// getArticles
		$page = isset($this->request->get['page']) ? $this->request->get['page'] : 1;      

		$limit = 5;
		$start = ($page - 1) * 5;
		$article_total = $this->model_simple_blog_article->getTotalArticle();

		$pagination = new Pagination();
		$pagination->total = $article_total;
		$pagination->page = $page;
		$pagination->limit = $limit; 
		$pagination->num_links = 5;
		//$pagination->text = 'text';
		$pagination->url = $this->url->link('account/dashboard', 'page={page}#anouncenment', 'SSL');
		if ($getLanguage == 'vietnamese') {
			$Language_id = 2;
		}else{
			$Language_id = 1;
		}
		$data['article_limit'] = $this -> model_simple_blog_article -> getArticleLimit($limit,$start, $Language_id);
		
		$data['pagination'] = $pagination->render();

		$data['pd_march'] = $this->model_account_customer->getPDMarch($this->session->data['customer_id']);
		///All GD
		$pages = isset($this -> request -> get['pages']) ? $this -> request -> get['pages'] : 1;

		//$data['pds'] = $this -> model_account_customer -> getAllPD($limit, $start);
		

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/dashboard.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/dashboard.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/login.tpl', $data));
		}
	}
	
	
	/*	public function get_all_customer(){
		$this->load->model('account/customer');
		$customer = $this -> model_account_customer -> getAllCustomer();

		$html = '';
		
		foreach ($customer as $key => $value) {
			$html .= '<li>';
                $html .= '<table width="200" border="0">';
                  $html .= '<tbody>';
                    $html .= '<tr>';
                      $html .= '<td rowspan="2" width="60" align="center"> ';
                        $html .= '<img src="catalog/view/theme/default/image/800px-Flag_of_Australia.svg.png" width="55" height="55">';
                      $html .= '</td>';
                      $html .= '<td align="left" valign="bottom">
                        <font face="Cambria, Hoefler Text, Liberation Serif, Times, Times New Roman, serif" size="4px">
                          <strong>'.$value['username'].'
                          </strong>
                        </font>';
                      $html .= '</td>';
                    $html .= '</tr>';
                    $html .= '<tr>';
                      $html .= '<td align="left" valign="top">'.$value['country_name'].'</td>';
                    $html .= '</tr>';
                  $html .= '</tbody>';
                $html .= '</table>';
           $html .= '</li>';
		}
		

		$json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	} */
	public function RequestGDMarch(){
		$this->load->model('account/customer');
		$gds = $this -> model_account_customer -> getAllGD(7, 0, 1);
		$html = '';
		
		foreach ($gds as $key => $value) {
			$html .= '<p class="list-group-item"><span class="badge">'.($value['amount']/100000000).' BTC</span>'.$value['username'].'</p>';
		}
	

		$json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	}
	public function RequestGDFinish(){
		$this->load->model('account/customer');
		$gds = $this -> model_account_customer -> getAllGD(7, 0, 2);
		$html = '';
		
		foreach ($gds as $key => $value) {
			$html .= '<p class="list-group-item"><span class="badge">'.($value['amount']/100000000).' BTC</span>'.$value['username'].'</p>';
		}
		

		$json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	}
	public function RequestPD(){
		$this->load->model('account/customer');
		$gds = $this -> model_account_customer -> getAllPD(7, 0,0);
		$html = '';
		
		foreach ($gds as $key => $value) {
			$html .= '<p class="list-group-item"><span class="badge">'.($value['filled']/100000000).' BTC</span>'.$value['username'].'</p>';
		}
	

		$json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	}
	public function RequestPDMarch(){
		$this->load->model('account/customer');
		$gds = $this -> model_account_customer -> getAllPD(7, 0, 1);
		$html = '';
		
		foreach ($gds as $key => $value) {
			$html .= '<p class="list-group-item"><span class="badge">'.($value['filled']/100000000).' BTC</span>'.$value['username'].'</p>';
		}
		

		$json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	}
	public function RequestPDFinish(){
		$this->load->model('account/customer');
		$gds = $this -> model_account_customer -> getAllPD(7, 0, 2);
		$html = '';
		
		foreach ($gds as $key => $value) {
			$html .= '<p class="list-group-item"><span class="badge">'.($value['filled']/100000000).' BTC</span>'.$value['username'].'</p>';
		}
		

		$json['html'] = $html;
		$html = null;
		$this -> response -> setOutput(json_encode($json));
	}
	public function viewBlogs(){
		function myCheckLoign($self) {
			return $self -> customer -> isLogged() ? true : false;
		};

		function myConfig($self) {
			$self -> document -> addScript('catalog/view/javascript/dashboard/dashboard.js');
			$self -> load -> model('simple_blog/article');
		};
		

		//language
		$this -> load -> model('account/customer');
		$getLanguage = $this -> model_account_customer -> getLanguage($this -> session -> data['customer_id']);
		$data['language']= $getLanguage;
		$language = new Language($getLanguage);
		$language -> load('account/dashboard');
		
		$data['lang'] = $language -> data;

		//method to call function
		!call_user_func_array("myCheckLoign", array($this)) && $this -> response -> redirect($this -> url -> link('account/login', '', 'SSL'));
		call_user_func_array("myConfig", array($this));

		//data render website
		//start load country model

		if ($this -> request -> server['HTTPS']) {
			$server = $this -> config -> get('config_ssl');
		} else {
			$server = $this -> config -> get('config_url');
		}

		$data['base'] = $server;
		$data['self'] = $this;
			//method to call function

			!$this -> request -> get['token']  && $this -> response -> redirect($this -> url -> link('account/dashboard', '', 'SSL'));
			$id_ = $this -> request -> get['token'];

if ($getLanguage == 'vietnamese') {
			$Language_id = 2;
		}else{
			$Language_id = 1;
		}
			$this->load->model('simple_blog/article');
			$data['detail_articles'] = $this->model_simple_blog_article->getArticlesBlogs($id_, $Language_id);        	
		
			if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/account/showblog.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/account/showblog.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/account/showblog.tpl', $data));
		}
		}

	public function changeLange(){
		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
			$json['success'] = $this -> model_account_customer -> updateLanguage( $this -> session -> data['customer_id'], $this -> request -> get['lang'] ) ;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	/*
	 *
	 * ajax count total tree member
	 */
	public function CountFloor() {
		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
		$floor1 = $this->model_account_customer->getCount_Floor($this -> session -> data['customer_id']);
		
		//Level 2
/*Tang 1*/	if(!empty($floor1)){
			$arrId='';
			$sumFloor1 = 0;
			foreach ($floor1 as $value) {
				if (intval($value['left']) != 0) {
					$arrId .= ','.$value['left'];
					$sumFloor1 = $sumFloor1 + 1;
				}
				if (intval($value['right']) != 0) {
					$arrId .= ','.$value['right'];
					$sumFloor1 = $sumFloor1 + 1;
				}
			}
			$json['sumFloor1'] = $sumFloor1;
			$arrId = substr($arrId, 1);
			//Tang 2
			$floor2 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 2*/	if(!empty($floor2)){
				$arrId='';
				$sumFloor2 = 0;
				foreach ($floor2 as $value) {
				if (intval($value['left']) != 0) {
						$arrId .= ','.$value['left'];
						$sumFloor2= $sumFloor2 + 1;
					}

					if (intval($value['right']) != 0) {
						$arrId .= ','.$value['right'];
						$sumFloor2 = $sumFloor2 + 1;
					}
				}

				$json['sumFloor2'] = $sumFloor2;
				$arrId = substr($arrId, 1);
				//Tang 3
				$floor3 = $this->model_account_customer->getCount_Floor($arrId);

/*Tang 3*/		if(!empty($floor3)){
					$arrId='';
					$sumFloor3 = 0;
					foreach ($floor3 as $value) {
						if (intval($value['left']) != 0) {
							$arrId .= ','.$value['left'];
							$sumFloor3= $sumFloor3 + 1;
						}

						if (intval($value['right']) != 0) {
							$arrId .= ','.$value['right'];
							$sumFloor3 = $sumFloor3 + 1;
						}
					}
					$json['sumFloor3'] = $sumFloor3;

					$arrId = substr($arrId, 1);
					//Tang 4
					$floor4 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 4*/			if(!empty($floor4)){
						$arrId='';
						$sumFloor4 = 0;
						foreach ($floor4 as $value) {
							if (intval($value['left']) != 0) {
								$arrId .= ','.$value['left'];
								$sumFloor4= $sumFloor4 + 1;
							}
							if (intval($value['right']) != 0) {
								$arrId .= ','.$value['right'];
								$sumFloor4 = $sumFloor4 + 1;
							}
						}
						$json['sumFloor4'] = $sumFloor4;
						$arrId = substr($arrId, 1);
						//Tang 5
						$floor5 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 5*/				if(!empty($floor5)){
							$arrId='';
							$sumFloor5 = 0;
							foreach ($floor5 as $value) {
								if (intval($value['left']) != 0) {
									$arrId .= ','.$value['left'];
									$sumFloor5= $sumFloor5 + 1;
								}
								if (intval($value['right']) != 0) {
									$arrId .= ','.$value['right'];
									$sumFloor5 = $sumFloor5 + 1;
								}
							}
							$json['sumFloor5'] = $sumFloor5;
							$arrId = substr($arrId, 1);
							//Tang 5
							$floor6 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 6*/					if(!empty($floor6)){
								$arrId='';
								$sumFloor6 = 0;
								foreach ($floor6 as $value) {
									if (intval($value['left']) != 0) {
										$arrId .= ','.$value['left'];
										$sumFloor6= $sumFloor6 + 1;
									}
									if (intval($value['right']) != 0) {
										$arrId .= ','.$value['right'];
										$sumFloor6 = $sumFloor6 + 1;
									}
								}
								$json['sumFloor6'] = $sumFloor6;
								$arrId = substr($arrId, 1);
								//Tang 5
/*Tang 7*/						$floor7 = $this->model_account_customer->getCount_Floor($arrId);
								if(!empty($floor7)){
									$arrId='';
									$sumFloor7 = 0;
									foreach ($floor7 as $value) {
										if (intval($value['left']) != 0) {
											$arrId .= ','.$value['left'];
											$sumFloor7= $sumFloor7 + 1;
										}
										if (intval($value['right']) != 0) {
											$arrId .= ','.$value['right'];
											$sumFloor7 = $sumFloor7 + 1;
										}
									}
									$json['sumFloor7'] = $sumFloor7;
									$arrId = substr($arrId, 1);
									//Tang 5
									$floor8 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 8*/							if(!empty($floor8)){
										$arrId='';
										$sumFloor8 = 0;
										foreach ($floor8 as $value) {
											if (intval($value['left']) != 0) {
												$arrId .= ','.$value['left'];
												$sumFloor8= $sumFloor8 + 1;
											}
											if (intval($value['right']) != 0) {
												$arrId .= ','.$value['right'];
												$sumFloor8 = $sumFloor8 + 1;
											}
										}
										$json['sumFloor8'] = $sumFloor8;
										$arrId = substr($arrId, 1);
										//Tang 5
										$floor9 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 9*/								if(!empty($floor9)){
											$arrId='';
											$sumFloor9 = 0;
											foreach ($floor9 as $value) {
												if (intval($value['left']) != 0) {
													$arrId .= ','.$value['left'];
													$sumFloor9= $sumFloor9 + 1;
												}
												if (intval($value['right']) != 0) {
													$arrId .= ','.$value['right'];
													$sumFloor9 = $sumFloor9 + 1;
												}
											}
											$json['sumFloor9'] = $sumFloor9;
											$arrId = substr($arrId, 1);
											//Tang 5
											$floor10 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 10*/									if(!empty($floor10)){
												$arrId='';
												$sumFloor10 = 0;
												foreach ($floor10 as $value) {
													if (intval($value['left']) != 0) {
														$arrId .= ','.$value['left'];
														$sumFloor10= $sumFloor10 + 1;
													}
													if (intval($value['right']) != 0) {
														$arrId .= ','.$value['right'];
														$sumFloor10 = $sumFloor10 + 1;
													}
												}
												$json['sumFloor10'] = $sumFloor10;
												$arrId = substr($arrId, 1);
												//Tang 5
												$floor11 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 11*/										if(!empty($floor11)){
													$arrId='';
													$sumFloor11 = 0;
													foreach ($floor11 as $value) {
														if (intval($value['left']) != 0) {
															$arrId .= ','.$value['left'];
															$sumFloor11= $sumFloor11 + 1;
														}
														if (intval($value['right']) != 0) {
															$arrId .= ','.$value['right'];
															$sumFloor11 = $sumFloor11 + 1;
														}
													}
													$json['sumFloor11'] = $sumFloor11;
													$arrId = substr($arrId, 1);
													//Tang 5
													$floor12 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 12*/											if(!empty($floor12)){
														$arrId='';
														$sumFloor12 = 0;
														foreach ($floor12 as $value) {
															if (intval($value['left']) != 0) {
																$arrId .= ','.$value['left'];
																$sumFloor12= $sumFloor12 + 1;
															}
															if (intval($value['right']) != 0) {
																$arrId .= ','.$value['right'];
																$sumFloor12 = $sumFloor12 + 1;
															}
														}
														$json['sumFloor12'] = $sumFloor12;
														$arrId = substr($arrId, 1);
														//Tang 5
/*Tang 13*/												$floor13 = $this->model_account_customer->getCount_Floor($arrId);
														if(!empty($floor13)){
															$arrId='';
															$sumFloor13 = 0;
															foreach ($floor13 as $value) {
																if (intval($value['left']) != 0) {
																	$arrId .= ','.$value['left'];
																	$sumFloor13= $sumFloor13 + 1;
																}
																if (intval($value['right']) != 0) {
																	$arrId .= ','.$value['right'];
																	$sumFloor13 = $sumFloor13 + 1;
																}
															}
															$json['sumFloor13'] = $sumFloor13;
															$arrId = substr($arrId, 1);
															//Tang 5
															$floor14 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 14*/													if(!empty($floor14)){
																$arrId='';
																$sumFloor14 = 0;
																foreach ($floor14 as $value) {
																	if (intval($value['left']) != 0) {
																		$arrId .= ','.$value['left'];
																		$sumFloor14= $sumFloor14 + 1;
																	}
																	if (intval($value['right']) != 0) {
																		$arrId .= ','.$value['right'];
																		$sumFloor14 = $sumFloor14 + 1;
																	}
																}
																$json['sumFloor14'] = $sumFloor14;
																$arrId = substr($arrId, 1);
																//Tang 5
																$floor15 = $this->model_account_customer->getCount_Floor($arrId);
/*Tang 15*/																if(!empty($floor15)){
																	$arrId='';
																	$sumFloor15 = 0;
																	foreach ($floor15 as $value) {
																		if (intval($value['left']) != 0) {
																			$arrId .= ','.$value['left'];
																			$sumFloor15= $sumFloor15 + 1;
																		}
																		if (intval($value['right']) != 0) {
																			$arrId .= ','.$value['right'];
																			$sumFloor15 = $sumFloor15 + 1;
																		}
																	}
																	$json['sumFloor15'] = $sumFloor15;
																	$arrId = substr($arrId, 1);
																	//$floor16 = $this->model_account_customer->getCount_Floor($arrId);

																} // Het Tang 15

															} // Het Tang 14

														} // Het Tang 13

													} // Het Tang 12

												} // Het Tang 11

											} // Het Tang 10

										} // Het Tang 9

									} // Het Tang 8

								} // Het Tang 7
								
							} // Het Tang 6
							
						} // Het Tang 5
						
					} // Het Tang 4
					
				} // Het Tang 3

			} //Het Tang 2

		} // Het Tang 1

			$this -> response -> setOutput(json_encode($json));
		}
	}
	public function total_binary_left(){
		$this -> load -> model('account/customer');

		$count = $this -> model_account_customer ->  getCustomer_ML($this -> session -> data['customer_id']);
		if(intval($count['left']) === 0){
			$json['success'] = 0;
		}else{
			$count = $this -> model_account_customer -> getCountBinaryTreeCustom($count['left']);
			$count = (intval($count) + 1);
			$json['success'] = $count;
		}

		$this -> response -> setOutput(json_encode($json));
	}
	public function total_ch_wallet(){
		$this -> load -> model('account/customer');

		$count = $this -> model_account_customer ->  getCustomer_CH($this -> session -> data['customer_id']);
		$json['amount'] = number_format($count['amount']);
		//print_r($this -> session -> data['customer_id']); die;
		$this -> response -> setOutput(json_encode($json));
	}

	public function total_binary_right(){
		$this -> load -> model('account/customer');

		$count = $this -> model_account_customer ->  getCustomer_ML($this -> session -> data['customer_id']);
		if(intval($count['right']) === 0){
			$json['success'] = 0;
		}else{
			$count = $this -> model_account_customer -> getCountBinaryTreeCustom($count['right']);
			$count = (intval($count) + 1);
			$json['success'] = $count;
		}
		$this -> response -> setOutput(json_encode($json));
	}


	public function total_pd_left(){
		$this -> load -> model('account/customer');
		$count = $this -> model_account_customer ->  getCustomer($this -> session -> data['customer_id']);
		if(intval($count['total_pd_left']) === 0){
			$json['success'] = 0;
		}else{
			$json['success'] = number_format($count['total_pd_left']);

		}

		$this -> response -> setOutput(json_encode($json));

	}
	public function hoahongconghuong(){
		$this -> load -> model('account/customer');
		$count = $this -> model_account_customer ->  hoahongconghuong($this -> session -> data['customer_id']);
		$getgoidautu =$this -> model_account_customer ->getgoidautu($this -> session -> data['customer_id']);
		//print_r($getgoidautu['filled']); die;
		$json = array();
		if (doubleval($count['total_pd_left']) >= doubleval($count['total_pd_right']))
		{	

			if (doubleval($getgoidautu['filled']) < 500000000){
				$json['phantram'] = doubleval($count['total_pd_right'])*0.1; 
			}
			
			if (doubleval($getgoidautu['filled']) >= 500000000 && doubleval($getgoidautu['filled']) < 1000000000){
				$json['phantram'] = doubleval($count['total_pd_right'])*0.11; 
			}
			if (doubleval($getgoidautu['filled']) >= 1000000000){
				$json['phantram'] = doubleval($count['total_pd_right'])*0.12; 
			}
		}
		else
		{
			if (doubleval($getgoidautu['filled']) < 500000000){
				$json['phantram'] = doubleval($count['total_pd_left'])*0.1;	
			}
			if (doubleval($getgoidautu['filled']) >= 500000000 && doubleval($getgoidautu['filled']) < 1000000000){
				$json['phantram'] = doubleval($count['total_pd_left'])*0.11;
			}
			if (doubleval($getgoidautu['filled']) >= 1000000000){
				$json['phantram'] = doubleval($count['total_pd_left'])*0.12;
			}
		}
			$json_phantram['phantram'] = number_format($json['phantram']);
		$this -> response -> setOutput(json_encode($json_phantram));

	}
	public function total_pd_right(){
		$this -> load -> model('account/customer');
		$count = $this -> model_account_customer ->  getCustomer($this -> session -> data['customer_id']);

		if(intval($count['total_pd_right']) === 0){
			$json['success'] = 0;
		}else{
			$json['success'] = number_format($count['total_pd_right']);

		}
		$this -> response -> setOutput(json_encode($json));
	}
	public function totalpin() {
		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
			$pin = $this -> model_account_customer -> getCustomer($this -> session -> data['customer_id']);
			$pin = $pin['ping'];
			$json['success'] = intval($pin);
			$pin = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function analytics() {

		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
			$json['success'] = intval($this -> model_account_customer -> getCountLevelCustom($this -> session -> data['customer_id'], $this -> request -> get['level']));
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function countPD(){
		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
			$getgoidautu =$this -> model_account_customer ->getgoidautu($this -> session -> data['customer_id']);
			//print_r($getgoidautu['filled']); die;
			$total = $getgoidautu['filled'];
			$json['success'] = number_format($total);
			$total = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}


	public function countGD(){
		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
			$total = $this -> model_account_customer -> getTotalGD($this -> session -> data['customer_id']);
			$total = $total['number'];
			$json['success'] = intval($total);
			$total = null;
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function getRWallet(){
		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');
			$checkR_Wallet = $this -> model_account_customer -> checkR_Wallet($this -> session -> data['customer_id']);
			if(intval($checkR_Wallet['number'])  === 0){
				if(!$this -> model_account_customer -> insertR_Wallet($this -> session -> data['customer_id'])){
					die();
				}
			}
			$total = $this -> model_account_customer -> getR_Wallet($this -> session -> data['customer_id']);
			$total = count($total) > 0 ? $total['amount'] : 0;
			$json['success'] = $total;
			$total = null;

			$checkR_Wallet = $this -> model_account_customer -> checkR_Wallet($this -> session -> data['customer_id']);
			if(intval($checkR_Wallet['number'])  === 0){
				if(!$this -> model_account_customer -> insertR_Wallet($this -> session -> data['customer_id'])){
					die();
				}
			}
			//get r-wallet of user received
			//$customerReceived = $this->model_account_customer->getCustomer($this -> session -> data['customer_id']);
			$getRwallet = $this -> model_account_customer -> getR_Wallet($this -> session -> data['customer_id']);
			$getGDRecived = $this -> model_account_customer -> getTotalGD($this -> session -> data['customer_id']);
			// if(intval($getGDRecived['number']) === 0 && intval($getRwallet['amount']) === 0 && intval($customerReceived['ping']) >= 6){
			// 	$this -> model_account_customer -> updateR_Wallet($customerReceived['customer_id'] , 3840000);
			// 	$this -> model_account_customer -> updateCheckNEwuser($customerReceived['customer_id']);
			// }
			$total = $this -> model_account_customer -> getR_Wallet($this -> session -> data['customer_id']);
			$total = count($total) > 0 ? $total['amount'] : 0;
			$json['success'] = $total;
			$json['success'] = number_format($json['success']);
			$this -> response -> setOutput(json_encode($json));
		}
	}

	public function getCWallet(){

		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');

			$checkC_Wallet = $this -> model_account_customer -> checkC_Wallet($this -> session -> data['customer_id']);


			if(intval($checkC_Wallet['number'])  === 0){
				if(!$this -> model_account_customer -> insertC_Wallet($this -> session -> data['customer_id'])){
					die();
				}
			}
			$total = $this -> model_account_customer -> getC_Wallet($this -> session -> data['customer_id']);
			$total = count($total) > 0 ? $total['amount'] : 0;
			$json['success'] = $total;
			$total = null;
			$json['success'] = number_format($json['success']);
			$this -> response -> setOutput(json_encode($json));
		}
	}
	public function getMWallet(){

		if ($this -> customer -> isLogged() && $this -> session -> data['customer_id']) {
			$this -> load -> model('account/customer');

			// $checkM_Wallet = $this -> model_account_customer -> checkM_Wallet($this -> session -> data['customer_id']);
			// if(intval($checkM_Wallet['number'])  === 0){
			// 	if(!$this -> model_account_customer -> insert_M_Wallet($this -> session -> data['customer_id'])){
			// 		die();
			// 	}
			// }
			$total = $this -> model_account_customer -> get_M_Wallet($this -> session -> data['customer_id']);
			$total = count($total) > 0 ? $total['amount'] : 0;
			
			$json['success'] = $total;
			
			$total = null;
			$json['success'] = number_format($json['success']);
			$this -> response -> setOutput(json_encode($json));
		}
	}

}
