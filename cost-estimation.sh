#!/bin/bash
echo -e "\033[1m Cost Estimation\033[0m"
aws macie2 get-usage-totals --query 'usageTotals[].{cost:estimatedCost,currency:currency}' --outpu table
echo "----------------------------------------------------------------------------------------------------------"
