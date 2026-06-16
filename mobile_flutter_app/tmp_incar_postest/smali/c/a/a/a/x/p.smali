.class public Lc/a/a/a/x/p;
.super Ljava/lang/Object;
.source "UtcDates.java"


# static fields
.field public static a:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lc/a/a/a/x/o;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    sput-object v0, Lc/a/a/a/x/p;->a:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;II)I
    .registers 6

    :goto_0
    if-ltz p3, :cond_2d

    .line 35
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p3, v0, :cond_2d

    .line 36
    invoke-virtual {p0, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2d

    .line 37
    invoke-virtual {p0, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x27

    if-ne v0, v1, :cond_2b

    :goto_1b
    add-int/2addr p3, p2

    if-ltz p3, :cond_2b

    .line 38
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-ge p3, v0, :cond_2b

    invoke-virtual {p0, p3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-eq v0, v1, :cond_2b

    goto :goto_1b

    :cond_2b
    add-int/2addr p3, p2

    goto :goto_0

    :cond_2d
    return p3
.end method

.method public static a(J)J
    .registers 3

    .line 7
    invoke-static {}, Lc/a/a/a/x/p;->f()Ljava/util/Calendar;

    move-result-object v0

    .line 8
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 9
    invoke-static {v0}, Lc/a/a/a/x/p;->a(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p0

    return-wide p0
.end method

.method public static a(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    .line 11
    invoke-static {p0, p1}, Landroid/icu/text/DateFormat;->getInstanceForSkeleton(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    .line 12
    invoke-static {}, Lc/a/a/a/x/p;->e()Landroid/icu/util/TimeZone;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/icu/text/DateFormat;->setTimeZone(Landroid/icu/util/TimeZone;)V

    return-object p0
.end method

.method public static a(Ljava/util/Locale;)Landroid/icu/text/DateFormat;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    const-string v0, "MMMd"

    .line 26
    invoke-static {v0, p0}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/content/res/Resources;Ljava/text/SimpleDateFormat;)Ljava/lang/String;
    .registers 5

    .line 21
    invoke-virtual {p1}, Ljava/text/SimpleDateFormat;->toLocalizedPattern()Ljava/lang/String;

    move-result-object p1

    .line 22
    sget v0, Lc/a/a/a/j;->mtrl_picker_text_input_year_abbr:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 23
    sget v1, Lc/a/a/a/j;->mtrl_picker_text_input_month_abbr:I

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 24
    sget v2, Lc/a/a/a/j;->mtrl_picker_text_input_day_abbr:I

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    const-string v2, "d"

    .line 25
    invoke-virtual {p1, v2, p0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "M"

    invoke-virtual {p0, p1, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "y"

    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    const/4 v0, 0x1

    const-string v1, "yY"

    const/4 v2, 0x0

    .line 27
    invoke-static {p0, v1, v0, v2}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v1

    .line 28
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_f

    return-object p0

    :cond_f
    const-string v2, "EMd"

    .line 29
    invoke-static {p0, v2, v0, v1}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v3

    .line 30
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_2c

    .line 31
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_2c
    const/4 v4, -0x1

    .line 32
    invoke-static {p0, v2, v4, v1}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v1

    add-int/2addr v1, v0

    .line 33
    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    const-string v1, " "

    .line 34
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static a(ILjava/util/Locale;)Ljava/text/DateFormat;
    .registers 2

    .line 13
    invoke-static {p0, p1}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p0

    .line 14
    invoke-static {}, Lc/a/a/a/x/p;->c()Ljava/util/TimeZone;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-object p0
.end method

.method public static a()Ljava/text/SimpleDateFormat;
    .registers 3

    .line 15
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1, v0}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v0

    check-cast v0, Ljava/text/SimpleDateFormat;

    .line 16
    invoke-virtual {v0}, Ljava/text/SimpleDateFormat;->toLocalizedPattern()Ljava/lang/String;

    move-result-object v0

    const-string v1, "\\s+"

    const-string v2, ""

    .line 17
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 18
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 19
    invoke-static {}, Lc/a/a/a/x/p;->c()Ljava/util/TimeZone;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    const/4 v0, 0x0

    .line 20
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->setLenient(Z)V

    return-object v1
.end method

.method public static a(Ljava/util/Calendar;)Ljava/util/Calendar;
    .registers 5

    .line 1
    invoke-static {p0}, Lc/a/a/a/x/p;->b(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object p0

    .line 2
    invoke-static {}, Lc/a/a/a/x/p;->f()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    move-result v1

    const/4 v2, 0x2

    .line 4
    invoke-virtual {p0, v2}, Ljava/util/Calendar;->get(I)I

    move-result v2

    const/4 v3, 0x5

    .line 5
    invoke-virtual {p0, v3}, Ljava/util/Calendar;->get(I)I

    move-result p0

    .line 6
    invoke-virtual {v0, v1, v2, p0}, Ljava/util/Calendar;->set(III)V

    return-object v0
.end method

.method public static b(Ljava/util/Locale;)Landroid/icu/text/DateFormat;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    const-string v0, "MMMEd"

    .line 6
    invoke-static {v0, p0}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static b()Lc/a/a/a/x/o;
    .registers 1

    .line 1
    sget-object v0, Lc/a/a/a/x/p;->a:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/x/o;

    if-nez v0, :cond_e

    .line 2
    invoke-static {}, Lc/a/a/a/x/o;->b()Lc/a/a/a/x/o;

    move-result-object v0

    :cond_e
    return-object v0
.end method

.method public static b(Ljava/util/Calendar;)Ljava/util/Calendar;
    .registers 4

    .line 3
    invoke-static {}, Lc/a/a/a/x/p;->c()Ljava/util/TimeZone;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object v0

    if-nez p0, :cond_e

    .line 4
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    goto :goto_15

    .line 5
    :cond_e
    invoke-virtual {p0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    :goto_15
    return-object v0
.end method

.method public static c(Ljava/util/Locale;)Ljava/text/DateFormat;
    .registers 2

    const/4 v0, 0x0

    .line 2
    invoke-static {v0, p0}, Lc/a/a/a/x/p;->a(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static c()Ljava/util/TimeZone;
    .registers 1

    const-string v0, "UTC"

    .line 1
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    return-object v0
.end method

.method public static d(Ljava/util/Locale;)Ljava/text/DateFormat;
    .registers 2

    const/4 v0, 0x2

    .line 7
    invoke-static {v0, p0}, Lc/a/a/a/x/p;->a(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static d()Ljava/util/Calendar;
    .registers 3

    .line 1
    invoke-static {}, Lc/a/a/a/x/p;->b()Lc/a/a/a/x/o;

    move-result-object v0

    invoke-virtual {v0}, Lc/a/a/a/x/o;->a()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x0

    const/16 v2, 0xb

    .line 2
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xc

    .line 3
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xd

    .line 4
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    const/16 v2, 0xe

    .line 5
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 6
    invoke-static {}, Lc/a/a/a/x/p;->c()Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTimeZone(Ljava/util/TimeZone;)V

    return-object v0
.end method

.method public static e()Landroid/icu/util/TimeZone;
    .registers 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    const-string v0, "UTC"

    .line 1
    invoke-static {v0}, Landroid/icu/util/TimeZone;->getTimeZone(Ljava/lang/String;)Landroid/icu/util/TimeZone;

    move-result-object v0

    return-object v0
.end method

.method public static e(Ljava/util/Locale;)Ljava/text/DateFormat;
    .registers 2

    .line 2
    invoke-static {p0}, Lc/a/a/a/x/p;->d(Ljava/util/Locale;)Ljava/text/DateFormat;

    move-result-object p0

    check-cast p0, Ljava/text/SimpleDateFormat;

    .line 3
    invoke-virtual {p0}, Ljava/text/SimpleDateFormat;->toPattern()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lc/a/a/a/x/p;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/text/SimpleDateFormat;->applyPattern(Ljava/lang/String;)V

    return-object p0
.end method

.method public static f(Ljava/util/Locale;)Landroid/icu/text/DateFormat;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    const-string v0, "yMMMd"

    .line 2
    invoke-static {v0, p0}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method

.method public static f()Ljava/util/Calendar;
    .registers 1

    const/4 v0, 0x0

    .line 1
    invoke-static {v0}, Lc/a/a/a/x/p;->b(Ljava/util/Calendar;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public static g(Ljava/util/Locale;)Landroid/icu/text/DateFormat;
    .registers 2
    .annotation build Landroid/annotation/TargetApi;
        value = 0x18
    .end annotation

    const-string v0, "yMMMEd"

    .line 1
    invoke-static {v0, p0}, Lc/a/a/a/x/p;->a(Ljava/lang/String;Ljava/util/Locale;)Landroid/icu/text/DateFormat;

    move-result-object p0

    return-object p0
.end method
