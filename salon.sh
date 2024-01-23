#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Golden Scissor Salon ~~~~~\n"

# Main
MAIN() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "Welcome to Golden Scissor Salon, how can I help you?\n"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  read SERVICE_ID_SELECTED
  SERVICES_MENU
}

# Services Menu
SERVICES_MENU() {
  # read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN "this not valid number"
  else
    # Get Service
    GET_SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $GET_SERVICE_ID ]]
    then
      MAIN "I could not find that service. What would you like today?"
    else
      # Get customer information
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_NAME ]]
      then
        echo "I don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      # Get customer ID
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      # insert service time to appointment
      INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES('$SERVICE_TIME', $CUSTOMER_ID, $GET_SERVICE_ID)")
      echo -e "I have put you down for a cut at $SERVICE_TIME, $CUSTOMER_NAME."
      
    fi
  fi

}

EXIT() {
  echo -e "\nTHANK YOU.\n"
}

MAIN
