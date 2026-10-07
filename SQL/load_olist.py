import pandas as pd
from sqlalchemy import create_engine

# PostgreSQL connection
engine = create_engine(
    "postgresql+psycopg2://postgres:12345@localhost:5432/olist_ecommerce"
)

# Processed data folder
data_path = r"D:\ME\project\Olist_Ecommerce_Analytics\processed_data"

files = {
    "customer_analysis": "customer_analysis.csv",
    "product_analysis": "product_analysis.csv",
    "category_analysis": "category_analysis.csv",
    "seller_analysis": "seller_analysis.csv",
    "delivery_review": "delivery_review.csv",
    "orders_with_state": "orders_with_state.csv",
    "orders_processed": "orders_processed.csv",
    "products_clean": "products_clean.csv"
}

for table_name, file_name in files.items():

    file_path = f"{data_path}\\{file_name}"

    df = pd.read_csv(file_path)

    df.to_sql(
        table_name,
        engine,
        if_exists="replace",
        index=False
    )

    print(f"{table_name}: {len(df)} rows loaded")

print("\nProcessed Olist data loaded successfully!")