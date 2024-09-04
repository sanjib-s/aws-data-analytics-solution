# AWS-DATA-ANALYTICS-PATTERNS


![image](https://github.com/user-attachments/assets/387edee4-28e3-4cbc-b26a-e0aafc0e28ce)


```markdown
# Four Parts of Data Analytics Pipeline

- **Collection**
- **Realtime / Batch Analysis**
- **Analytics**
- **Visualization**

# Key Design Components

- **CloudWatch subscription filter**: Streams log data to Amazon Kinesis Firehose.
- Logs intended for **batch processing** are sent to S3.
- Logs intended for **real-time analysis** are delivered to Amazon Kinesis Data Analytics.
- **AWS Glue** collects the logs from S3 and performs transformation & analysis.
- An **OpenSearch Dashboard** is used to visualize the metrics from Amazon OpenSearch.

# Key Design Considerations

- When to use Amazon Kinesis Data Streams vs. Amazon Kinesis Data Firehose, or both:
  
  - Amazon Kinesis Data Streams: Suitable for real-time processing. It provides customization capabilities, allowing developers to write custom logic for processing data as it flows through the stream.

  - Kinesis Data Firehose**: A managed service for real-time streaming to Redshift/S3. It simplifies the process of loading data for storage and analytics.

  - Combined Use**: Offers the flexibility and real-time processing capabilities of Kinesis Data Streams with the simplicity and integration ease of Kinesis Data Firehose.

- When to use Amazon Kinesis Data Analytics**: Ideal for scenarios that require real-time analytics and complex data processing capabilities directly on the streaming data.
```
Above Data Analytics design patten enhancement for GEN AI use cases

![image](https://github.com/user-attachments/assets/3308e5e2-2595-40f6-918e-20df16349df8)

# Key Design Consideration

- As part of using real-time data to train the model:

  - Real-time data from S3 is sent to **Athena** to run the required queries, and the output is saved back to S3.
  - This S3 data will be used to train a **SageMaker** model.
  
- The trained and approved model will be made available for use in **Gen AI** applications.

- Once the model is trained with real-time data, it will be deployed:

  - **Lambda** function will use the trained model for Gen AI applications and for the **Chatbot**. Lambda function will be used as agent.



Terraform code for AWS data analytics
 Repo will contain detail pattern and sample service deploy code
