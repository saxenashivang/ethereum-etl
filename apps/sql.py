from subprocess import check_output

from pyspark.conf import SparkConf
from pyspark.sql import SparkSession
from pyspark.sql.functions import col

spark_conf = SparkConf()

SPARK_DRIVER_HOST = check_output(["hostname", "-i"]).decode(encoding="utf-8").strip()
CSV_PATH = "blocks_data/blocks.csv"
spark_conf.setAll(
    [
        (
            "spark.master",
            "spark://spark:7077",
        ),
        ("spark.app.name", "myApp"),
        ("spark.submit.deployMode", "client"),
        ("spark.ui.showConsoleProgress", "true"),
        ("spark.eventLog.enabled", "false"),
        ("spark.logConf", "false"),
        (
            "spark.driver.bindAddress",
            "0.0.0.0",
        ),
        (
            "spark.driver.host",
            SPARK_DRIVER_HOST,
        ),
    ]
)

spark_sess = SparkSession.builder.config(conf=spark_conf).getOrCreate()
spark_reader = spark_sess.read

df = spark_sess.read.csv(CSV_PATH, sep=',', inferSchema=True, header=True)
df.select(col("number"), col("transaction_count")).show()

spark_sess.stop()
quit()
