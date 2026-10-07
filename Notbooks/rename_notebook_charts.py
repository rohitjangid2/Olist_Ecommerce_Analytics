from pathlib import Path

image_dir = Path("images")

names = [
    "orders_by_year.png",
    "orders_by_month.png",
    "monthly_revenue.png",
    "customer_type_distribution.png",
    "customer_spending_distribution.png",
    "average_spending_by_customer_type.png",
    "repeat_customer_order_frequency.png",
    "top_10_categories_by_revenue.png",
    "top_10_sellers_by_sales.png",
    "payment_method_distribution.png",
    "payment_count_vs_value_share.png",
    "average_payment_value_by_method.png",
    "delivery_time_distribution.png",
    "delivery_performance.png",
    "delivery_time_vs_review_score.png",
    "delivery_time_outlier_detection.png",
    "review_score_distribution.png",
    "delivery_performance_by_status.png",
    "order_status_distribution.png",
    "order_value_outlier_detection.png",
    "top_10_products_by_sales.png",
    "customer_share_vs_revenue_share.png",
    "top_10_states_by_customer_share.png",
    "top_10_states_by_revenue.png",
    "top_10_states_by_revenue_share.png",
]

for i, new_name in enumerate(names, start=1):
    old_file = image_dir / f"notebook_chart_{i:02d}.png"
    new_file = image_dir / new_name

    if old_file.exists():
        old_file.rename(new_file)
        print(f"Renamed: {old_file.name} -> {new_file.name}")
    else:
        print(f"Missing: {old_file.name}")

print("\nRenaming completed.")
