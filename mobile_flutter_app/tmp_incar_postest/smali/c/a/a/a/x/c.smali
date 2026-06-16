.class public abstract Lc/a/a/a/x/c;
.super Lc/a/a/a/d0/l;
.source "DateFormatTextWatcher.java"


# instance fields
.field public final h:Lcom/google/android/material/textfield/TextInputLayout;

.field public final i:Ljava/text/DateFormat;

.field public final j:Lcom/google/android/material/datepicker/CalendarConstraints;

.field public final k:Ljava/lang/String;

.field public final l:Ljava/lang/Runnable;

.field public m:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/text/DateFormat;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/datepicker/CalendarConstraints;)V
    .registers 5

    .line 1
    invoke-direct {p0}, Lc/a/a/a/d0/l;-><init>()V

    .line 2
    iput-object p2, p0, Lc/a/a/a/x/c;->i:Ljava/text/DateFormat;

    .line 3
    iput-object p3, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    .line 4
    iput-object p4, p0, Lc/a/a/a/x/c;->j:Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 5
    invoke-virtual {p3}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Lc/a/a/a/j;->mtrl_picker_out_of_range:I

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lc/a/a/a/x/c;->k:Ljava/lang/String;

    .line 6
    new-instance p2, Lc/a/a/a/x/c$a;

    invoke-direct {p2, p0, p1}, Lc/a/a/a/x/c$a;-><init>(Lc/a/a/a/x/c;Ljava/lang/String;)V

    iput-object p2, p0, Lc/a/a/a/x/c;->l:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/x/c;)Lcom/google/android/material/textfield/TextInputLayout;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    return-object p0
.end method

.method public static synthetic b(Lc/a/a/a/x/c;)Ljava/text/DateFormat;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/c;->i:Ljava/text/DateFormat;

    return-object p0
.end method

.method public static synthetic c(Lc/a/a/a/x/c;)Ljava/lang/String;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/c;->k:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public final a(J)Ljava/lang/Runnable;
    .registers 4

    .line 2
    new-instance v0, Lc/a/a/a/x/c$b;

    invoke-direct {v0, p0, p1, p2}, Lc/a/a/a/x/c$b;-><init>(Lc/a/a/a/x/c;J)V

    return-object v0
.end method

.method public abstract a()V
.end method

.method public a(Landroid/view/View;Ljava/lang/Runnable;)V
    .registers 5

    const-wide/16 v0, 0x3e8

    .line 3
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public abstract a(Ljava/lang/Long;)V
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 1
    iget-object p2, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p3, p0, Lc/a/a/a/x/c;->l:Ljava/lang/Runnable;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 2
    iget-object p2, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p3, p0, Lc/a/a/a/x/c;->m:Ljava/lang/Runnable;

    invoke-virtual {p2, p3}, Landroid/widget/LinearLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 3
    iget-object p2, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    .line 4
    invoke-virtual {p0, p3}, Lc/a/a/a/x/c;->a(Ljava/lang/Long;)V

    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1e

    return-void

    .line 6
    :cond_1e
    :try_start_1e
    iget-object p2, p0, Lc/a/a/a/x/c;->i:Ljava/text/DateFormat;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    .line 7
    iget-object p2, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p2, p3}, Lcom/google/android/material/textfield/TextInputLayout;->setError(Ljava/lang/CharSequence;)V

    .line 8
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide p2

    .line 9
    iget-object p4, p0, Lc/a/a/a/x/c;->j:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {p4}, Lcom/google/android/material/datepicker/CalendarConstraints;->e()Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    move-result-object p4

    invoke-interface {p4, p2, p3}, Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;->a(J)Z

    move-result p4

    if-eqz p4, :cond_51

    iget-object p4, p0, Lc/a/a/a/x/c;->j:Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 10
    invoke-virtual {p4, p2, p3}, Lcom/google/android/material/datepicker/CalendarConstraints;->c(J)Z

    move-result p4

    if-eqz p4, :cond_51

    .line 11
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc/a/a/a/x/c;->a(Ljava/lang/Long;)V

    return-void

    .line 12
    :cond_51
    invoke-virtual {p0, p2, p3}, Lc/a/a/a/x/c;->a(J)Ljava/lang/Runnable;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/x/c;->m:Ljava/lang/Runnable;

    .line 13
    iget-object p2, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p0, p2, p1}, Lc/a/a/a/x/c;->a(Landroid/view/View;Ljava/lang/Runnable;)V
    :try_end_5c
    .catch Ljava/text/ParseException; {:try_start_1e .. :try_end_5c} :catch_5d

    goto :goto_64

    .line 14
    :catch_5d
    iget-object p1, p0, Lc/a/a/a/x/c;->h:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p2, p0, Lc/a/a/a/x/c;->l:Ljava/lang/Runnable;

    invoke-virtual {p0, p1, p2}, Lc/a/a/a/x/c;->a(Landroid/view/View;Ljava/lang/Runnable;)V

    :goto_64
    return-void
.end method
