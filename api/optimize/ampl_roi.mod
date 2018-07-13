set campaign;
param x {campaign};
param y {campaign};
param z {campaign};
param min_cost {campaign};
param max_cost {campaign};
param min_total;
param max_total;
var cost {campaign};
maximize total_profit:
	(
		sum {j in campaign} ((x[j]*log(cost[j])+y[j])*z[j])
		- sum {j in campaign} cost[j]
	) / sum {j in campaign} cost[j];
	
subject to bound_cost {j in campaign}: min_cost[j] <= cost[j] <= max_cost[j];
subject to bound_total : min_total <= sum {j in campaign} cost[j] <= max_total;
