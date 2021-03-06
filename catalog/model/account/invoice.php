<?php
class ModelAccountInvoice extends Model {
	
	public function getAllInvoiceByCustomer($customer_id, $limit, $offset){
		$query = $this -> db -> query("
			SELECT amount, received, confirmations, date_created, pin, input_address
			FROM ". DB_PREFIX ."customer_invoice_active_btc
			WHERE customer_id = '". $customer_id ."'
			ORDER BY confirmations ASC
			LIMIT ".$limit."
			OFFSET ".$offset."
		");
		return $query -> rows;
	}
 
	public function getAllInvoiceByCustomer_notCreateOrder($customer_id){
		$query = $this -> db -> query("
			SELECT invoice_id_hash, amount, received, confirmations, date_created,input_address
			FROM ". DB_PREFIX ."customer_invoice_active_btc
			WHERE customer_id = '". $customer_id ."' AND confirmations = 0
			ORDER BY date_created DESC
		");
		return $query -> row;
	}

	public function getInvoceFormHash($invoice_id_hash, $customer_id){
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX ."customer_invoice_active_btc
			WHERE customer_id = '". $customer_id ."' AND invoice_id_hash = ".$invoice_id_hash."
		");
		return $query -> row;
	}

	public function getAllInvoiceByCustomerTotal($customer_id){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM ". DB_PREFIX ."customer_invoice_active_btc
			WHERE customer_id = '". $customer_id ."'
		");
		return $query -> row;
	}

	public function countInvoice($id_customer){
		$query = $this -> db -> query("
			SELECT COUNT(*) AS number
			FROM ". DB_PREFIX ."customer_invoice_active_btc
			WHERE customer_id = '". $id_customer ."' AND confirmations = 0
		");
		return $query -> row;
	}

	public function updateInaddressAndFree($invoice_id, $invoice_id_hash , $input_addr, $fee_percent, $my_addr){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_active_btc SET
			input_address = '".$input_addr."',
			fee_percent = ".$fee_percent.",
			my_address = '".$my_addr."',
			invoice_id_hash = '".$invoice_id_hash."'
			WHERE invoice_id = ".$invoice_id."");
		return $query;
	}

	public function updateConfirm($invoice_id_hash, $confirmations, $transaction_hash, $input_transaction_hash){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_active_btc SET
			confirmations = ".$confirmations."
			WHERE invoice_id_hash = ". $invoice_id_hash."");
		return $query;
	}

	public function updateReceived($received, $invoice_id_hash){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer_invoice_active_btc SET
			received = received + '" . $received . "'
			WHERE invoice_id_hash = '" . $invoice_id_hash . "'");
		return $query;
	}

	public function updatePin($id_customer, $pin){

		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer SET
			ping = ping + '" . $this -> db -> escape((int)$pin) . "'
			WHERE customer_id = '" . (int)$id_customer . "'");
		return $query;
	}

	public function saveHistoryPin($id_customer, $amount, $user_description, $type , $system_description){
		$this -> db -> query("INSERT INTO " . DB_PREFIX . "ping_history SET
			id_customer = '" . $this -> db -> escape($id_customer) . "',
			amount = '" . $this -> db -> escape( $amount ) . "',
			date_added = NOW(),
			user_description = '" .$this -> db -> escape($user_description). "',
			type = '" .$this -> db -> escape($type). "',
			system_description = '" .$this -> db -> escape($system_description). "'
		");
		return $this -> db -> getLastId();
	}

	public function saveInvoice($customer_id, $secret, $amount){
		$query = $this -> db -> query("
			INSERT INTO ".DB_PREFIX."customer_invoice_active_btc SET
			customer_id = '".$customer_id."',
			secret = '".$secret."',
			amount = ".$amount.",
			received = 0,
			date_created = NOW()
		");

		return $query === True ? $this->db->getLastId() : -1;
	}

	public function getInvoiceByIdAndSecret($invoice_id_hash, $secret, $input_address){
		$query = $this -> db -> query("
			SELECT *
			FROM ". DB_PREFIX ."customer_invoice_active_btc
			WHERE invoice_id_hash = '". $invoice_id_hash ."' AND 
				  secret = '".$secret."' AND
				  confirmations = 0 AND
				  input_address = '".$input_address."'
		");
		return $query -> row;
	}
	public function updateNew_user($customer_id){
		$query = $this -> db -> query("
			UPDATE " . DB_PREFIX . "customer SET
			check_Newuser = 0
			WHERE customer_id = '".(int)$customer_id."'");
		return $query;
	}
}