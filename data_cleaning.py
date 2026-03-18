import pandas as pd
import csv

def get_quarterly(data_path, date_column):
    df = pd.read_csv(data_path)
    df[date_column] = pd.to_datetime(df[date_column])
    df = df.set_index(date_column)
    df_quarterly = df.resample('QE').mean()
    df_quarterly['quarter'] = df_quarterly.index.quarter
    df_quarterly['year'] = df_quarterly.index.year
    return df_quarterly

mortgage_df = get_quarterly('data/30yr_mortgage.csv', 'observation_date')
mortgage_df.to_csv('data/cleaned_mortgage.csv', index=True)

unemployment_df = get_quarterly('data/unemployment_rate.csv', 'observation_date')
unemployment_df.to_csv('data/cleaned_unemployment_rate.csv', index=True)

job_posting_df = get_quarterly('data/job_postings.csv', 'observation_date')
job_posting_df.to_csv('data/cleaned_job_posting.csv', index=True)


avg_housing_df = pd.read_csv('data/avg_housing_prices.csv')
avg_housing_df['date'] = pd.to_datetime(avg_housing_df['observation_date'])
avg_housing_df['quarter'] = avg_housing_df['date'].dt.quarter
avg_housing_df['year'] = avg_housing_df['date'].dt.year
avg_housing_df.to_csv('data/cleaned_avg_housing.csv', index=True)

