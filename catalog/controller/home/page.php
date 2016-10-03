<?php
class ControllerHomePage extends Controller {
	public function index() {
		if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}

		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/home.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/home.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/home.tpl', $data));
		}
	}
	public function news() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/news.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/news.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/news.tpl', $data));
		}
	}
	public function project() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/project.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/project.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/project.tpl', $data));
		}
	}
	public function parther() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/parther.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/parther.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/parther.tpl', $data));
		}
	}
	public function faq() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/faq.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/faq.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/faq.tpl', $data));
		}
	}
	public function detail_news() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/detail_news.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/detail_news.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/detail_news.tpl', $data));
		}
	}
	public function contact() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/contact.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/contact.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/contact.tpl', $data));
		}
	}
	public function about() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/about.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/about.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/about.tpl', $data));
		}
	}
	public function register() {
if (isset($this -> request ->get['route'])) {
			$data['route'] = $this -> request ->get['route'];
		}
		else{
			$data['route'] ='home/page';
		}
		$data['base'] = HTTPS_SERVER;
		$data['self'] = $this;
		$data['action_form'] = $this->url->link('home/page/submit');

		if (file_exists(DIR_TEMPLATE . $this -> config -> get('config_template') . '/template/home/register.tpl')) {
			$this -> response -> setOutput($this -> load -> view($this -> config -> get('config_template') . '/template/home/register.tpl', $data));
		} else {
			$this -> response -> setOutput($this -> load -> view('default/template/home/register.tpl', $data));
		}
	}
	public function submit(){
		$this -> load ->model('account/customer');
		!$this -> request -> post['code'] && $this -> response -> redirect($this -> url -> link('home/page/register', '', 'SSL'));

		$code = $this -> model_account_customer -> get_code($this -> request -> post['code']);

		empty($code) && $this -> response -> redirect($this -> url -> link('home/page/register#error', '', 'SSL'));

		$this -> response -> redirect($this -> url -> link('account/personal/add_customer', 'code='.$this -> request -> post['code'], 'SSL'));
	}
}