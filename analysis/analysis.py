import os
import pandas as pd
import psycopg2 as pg

if __name__ == '__main__':
    conn = pg.connect(f"""
        dbname='{os.getenv("DBNAME")}' 
        user='{os.getenv("DBUSER")}' 
        host='{os.getenv("DBHOST")}' 
        port='{os.getenv("DBPORT")}' 
        password='{os.getenv("DBPASSWORD")}'
    """)

    cursor = conn.cursor()

    # для генерации данных можете использовать библиотеку Faker
    # https://pypi.org/project/Faker/

    cursor.execute("""
    INSERT INTO cd.facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) VALUES
        (0, 'Tennis Court 1', 5, 25, 10000, 200),
        (1, 'Tennis Court 2', 5, 25, 8000, 200),
        (2, 'Badminton Court', 0, 15.5, 4000, 50);
    """)

    cursor.execute("""
    INSERT INTO cd.members (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate) VALUES
        (0, 'GUEST', 'GUEST', 'GUEST', 0, '(000) 000-0000', NULL, '2012-07-01 00:00:00'),
        (1, 'Smith', 'Darren', '8 Bloomsbury Close, Boston', 4321, '555-555-5555', NULL, '2012-07-02 12:02:05'),
        (2, 'Smith', 'Tracy', '8 Bloomsbury Close, New York', 4321, '555-555-5555', NULL, '2012-07-02 12:08:23');
    """)

    conn.commit()

    # дальше стоит провести какой-то анализ с помощью pandas, построить графики/хитмапы

    columns=["facid", "name", "membercost", "guestcost", "initialoutlay", "monthlymaintenance"]
    df = pd.DataFrame(columns=columns)
    cursor.execute(f"SELECT {', '.join(columns)} FROM cd.facilities")
    rows = cursor.fetchall()
    for row in rows:
        df = pd.concat(
            [df, pd.DataFrame.from_dict(dict(zip(columns, list(map(lambda x: [x], row)))))],
            ignore_index=True
        )
    print(df)
