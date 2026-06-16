.class public Lc/a/a/a/x/d;
.super Ljava/lang/Object;
.source "DateStrings.java"


# direct methods
.method public static a(Ljava/lang/Long;Ljava/lang/Long;)Lb/h/l/d;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            ")",
            "Lb/h/l/d<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 15
    invoke-static {p0, p1, v0}, Lc/a/a/a/x/d;->a(Ljava/lang/Long;Ljava/lang/Long;Ljava/text/SimpleDateFormat;)Lb/h/l/d;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/Long;Ljava/lang/Long;Ljava/text/SimpleDateFormat;)Lb/h/l/d;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Long;",
            "Ljava/lang/Long;",
            "Ljava/text/SimpleDateFormat;",
            ")",
            "Lb/h/l/d<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_a

    if-nez p1, :cond_a

    .line 16
    invoke-static {v0, v0}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0

    :cond_a
    if-nez p0, :cond_19

    .line 17
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    invoke-static {p0, p1, p2}, Lc/a/a/a/x/d;->a(JLjava/text/SimpleDateFormat;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0

    :cond_19
    if-nez p1, :cond_28

    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide p0

    invoke-static {p0, p1, p2}, Lc/a/a/a/x/d;->a(JLjava/text/SimpleDateFormat;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v0}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0

    .line 19
    :cond_28
    invoke-static {}, Lc/a/a/a/x/p;->d()Ljava/util/Calendar;

    move-result-object v0

    .line 20
    invoke-static {}, Lc/a/a/a/x/p;->f()Ljava/util/Calendar;

    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 22
    invoke-static {}, Lc/a/a/a/x/p;->f()Ljava/util/Calendar;

    move-result-object v2

    .line 23
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    if-eqz p2, :cond_63

    .line 24
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 25
    new-instance p0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 26
    invoke-virtual {p2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    .line 27
    invoke-static {p1, p0}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0

    :cond_63
    const/4 p2, 0x1

    .line 28
    invoke-virtual {v1, p2}, Ljava/util/Calendar;->get(I)I

    move-result v3

    invoke-virtual {v2, p2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ne v3, v2, :cond_b2

    .line 29
    invoke-virtual {v1, p2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result p2

    if-ne v1, p2, :cond_95

    .line 30
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lc/a/a/a/x/d;->a(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lc/a/a/a/x/d;->a(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 31
    invoke-static {p0, p1}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0

    .line 32
    :cond_95
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lc/a/a/a/x/d;->a(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lc/a/a/a/x/d;->c(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 33
    invoke-static {p0, p1}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0

    .line 34
    :cond_b2
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-static {v0, v1, p0}, Lc/a/a/a/x/d;->c(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lc/a/a/a/x/d;->c(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 35
    invoke-static {p0, p1}, Lb/h/l/d;->a(Ljava/lang/Object;Ljava/lang/Object;)Lb/h/l/d;

    move-result-object p0

    return-object p0
.end method

.method public static a(J)Ljava/lang/String;
    .registers 3

    const/4 v0, 0x0

    .line 6
    invoke-static {p0, p1, v0}, Lc/a/a/a/x/d;->a(JLjava/text/SimpleDateFormat;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(JLjava/text/SimpleDateFormat;)Ljava/lang/String;
    .registers 5

    .line 7
    invoke-static {}, Lc/a/a/a/x/p;->d()Ljava/util/Calendar;

    move-result-object v0

    .line 8
    invoke-static {}, Lc/a/a/a/x/p;->f()Ljava/util/Calendar;

    move-result-object v1

    .line 9
    invoke-virtual {v1, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    if-eqz p2, :cond_17

    .line 10
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 11
    invoke-virtual {p2, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_17
    const/4 p2, 0x1

    .line 12
    invoke-virtual {v0, p2}, Ljava/util/Calendar;->get(I)I

    move-result v0

    invoke-virtual {v1, p2}, Ljava/util/Calendar;->get(I)I

    move-result p2

    if-ne v0, p2, :cond_27

    .line 13
    invoke-static {p0, p1}, Lc/a/a/a/x/d;->b(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 14
    :cond_27
    invoke-static {p0, p1}, Lc/a/a/a/x/d;->d(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(JLjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .line 3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_14

    .line 4
    invoke-static {p2}, Lc/a/a/a/x/p;->a(Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 5
    :cond_14
    invoke-static {p2}, Lc/a/a/a/x/p;->e(Ljava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/Context;J)Ljava/lang/String;
    .registers 5

    .line 1
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v0

    int-to-long v0, v0

    sub-long/2addr p1, v0

    const/16 v0, 0x24

    .line 2
    invoke-static {p0, p1, p2, v0}, Landroid/text/format/DateUtils;->formatDateTime(Landroid/content/Context;JI)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static b(J)Ljava/lang/String;
    .registers 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lc/a/a/a/x/d;->a(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static b(JLjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_14

    .line 3
    invoke-static {p2}, Lc/a/a/a/x/p;->b(Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 4
    :cond_14
    invoke-static {p2}, Lc/a/a/a/x/p;->c(Ljava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(J)Ljava/lang/String;
    .registers 3

    .line 4
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lc/a/a/a/x/d;->b(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static c(JLjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_14

    .line 2
    invoke-static {p2}, Lc/a/a/a/x/p;->f(Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 3
    :cond_14
    invoke-static {p2}, Lc/a/a/a/x/p;->d(Ljava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static d(J)Ljava/lang/String;
    .registers 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lc/a/a/a/x/d;->c(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static d(JLjava/util/Locale;)Ljava/lang/String;
    .registers 5

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_14

    .line 3
    invoke-static {p2}, Lc/a/a/a/x/p;->g(Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Landroid/icu/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 4
    :cond_14
    invoke-static {p2}, Lc/a/a/a/x/p;->c(Ljava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p2

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static e(J)Ljava/lang/String;
    .registers 3

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lc/a/a/a/x/d;->d(JLjava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
