.class public Lc/a/a/a/x/j;
.super Landroid/widget/BaseAdapter;
.source "MonthAdapter.java"


# static fields
.field public static final m:I


# instance fields
.field public final h:Lcom/google/android/material/datepicker/Month;

.field public final i:Lcom/google/android/material/datepicker/DateSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/datepicker/DateSelector<",
            "*>;"
        }
    .end annotation
.end field

.field public j:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field public k:Lc/a/a/a/x/b;

.field public final l:Lcom/google/android/material/datepicker/CalendarConstraints;


# direct methods
.method public static constructor <clinit>()V
    .registers 2

    .line 1
    invoke-static {}, Lc/a/a/a/x/p;->f()Ljava/util/Calendar;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->getMaximum(I)I

    move-result v0

    sput v0, Lc/a/a/a/x/j;->m:I

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/DateSelector;Lcom/google/android/material/datepicker/CalendarConstraints;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/material/datepicker/Month;",
            "Lcom/google/android/material/datepicker/DateSelector<",
            "*>;",
            "Lcom/google/android/material/datepicker/CalendarConstraints;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    .line 3
    iput-object p2, p0, Lc/a/a/a/x/j;->i:Lcom/google/android/material/datepicker/DateSelector;

    .line 4
    iput-object p3, p0, Lc/a/a/a/x/j;->l:Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 5
    invoke-interface {p2}, Lcom/google/android/material/datepicker/DateSelector;->d()Ljava/util/Collection;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/x/j;->j:Ljava/util/Collection;

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 26
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->e()I

    move-result v0

    return v0
.end method

.method public a(I)I
    .registers 3

    add-int/lit8 p1, p1, -0x1

    .line 27
    invoke-virtual {p0}, Lc/a/a/a/x/j;->a()I

    move-result v0

    add-int/2addr v0, p1

    return v0
.end method

.method public final a(Landroid/content/Context;)V
    .registers 3

    .line 24
    iget-object v0, p0, Lc/a/a/a/x/j;->k:Lc/a/a/a/x/b;

    if-nez v0, :cond_b

    .line 25
    new-instance v0, Lc/a/a/a/x/b;

    invoke-direct {v0, p1}, Lc/a/a/a/x/b;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lc/a/a/a/x/j;->k:Lc/a/a/a/x/b;

    :cond_b
    return-void
.end method

.method public final a(Landroid/widget/TextView;J)V
    .registers 7

    if-nez p1, :cond_3

    return-void

    .line 12
    :cond_3
    iget-object v0, p0, Lc/a/a/a/x/j;->l:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->e()Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;

    move-result-object v0

    invoke-interface {v0, p2, p3}, Lcom/google/android/material/datepicker/CalendarConstraints$DateValidator;->a(J)Z

    move-result v0

    if-eqz v0, :cond_34

    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 14
    invoke-virtual {p0, p2, p3}, Lc/a/a/a/x/j;->a(J)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 15
    iget-object p2, p0, Lc/a/a/a/x/j;->k:Lc/a/a/a/x/b;

    iget-object p2, p2, Lc/a/a/a/x/b;->b:Lc/a/a/a/x/a;

    goto :goto_3c

    .line 16
    :cond_1e
    invoke-static {}, Lc/a/a/a/x/p;->d()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    cmp-long v2, v0, p2

    if-nez v2, :cond_2f

    .line 17
    iget-object p2, p0, Lc/a/a/a/x/j;->k:Lc/a/a/a/x/b;

    iget-object p2, p2, Lc/a/a/a/x/b;->c:Lc/a/a/a/x/a;

    goto :goto_3c

    .line 18
    :cond_2f
    iget-object p2, p0, Lc/a/a/a/x/j;->k:Lc/a/a/a/x/b;

    iget-object p2, p2, Lc/a/a/a/x/b;->a:Lc/a/a/a/x/a;

    goto :goto_3c

    :cond_34
    const/4 p2, 0x0

    .line 19
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 20
    iget-object p2, p0, Lc/a/a/a/x/j;->k:Lc/a/a/a/x/b;

    iget-object p2, p2, Lc/a/a/a/x/b;->g:Lc/a/a/a/x/a;

    .line 21
    :goto_3c
    invoke-virtual {p2, p1}, Lc/a/a/a/x/a;->a(Landroid/widget/TextView;)V

    return-void
.end method

.method public a(Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/j;->j:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 2
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p0, p1, v1, v2}, Lc/a/a/a/x/j;->a(Lcom/google/android/material/datepicker/MaterialCalendarGridView;J)V

    goto :goto_6

    .line 3
    :cond_1a
    iget-object v0, p0, Lc/a/a/a/x/j;->i:Lcom/google/android/material/datepicker/DateSelector;

    if-eqz v0, :cond_42

    .line 4
    invoke-interface {v0}, Lcom/google/android/material/datepicker/DateSelector;->d()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_26
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    .line 5
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-virtual {p0, p1, v1, v2}, Lc/a/a/a/x/j;->a(Lcom/google/android/material/datepicker/MaterialCalendarGridView;J)V

    goto :goto_26

    .line 6
    :cond_3a
    iget-object p1, p0, Lc/a/a/a/x/j;->i:Lcom/google/android/material/datepicker/DateSelector;

    invoke-interface {p1}, Lcom/google/android/material/datepicker/DateSelector;->d()Ljava/util/Collection;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/x/j;->j:Ljava/util/Collection;

    :cond_42
    return-void
.end method

.method public final a(Lcom/google/android/material/datepicker/MaterialCalendarGridView;J)V
    .registers 6

    .line 7
    invoke-static {p2, p3}, Lcom/google/android/material/datepicker/Month;->d(J)Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0, v1}, Lcom/google/android/material/datepicker/Month;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 8
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0, p2, p3}, Lcom/google/android/material/datepicker/Month;->c(J)I

    move-result v0

    .line 9
    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lc/a/a/a/x/j;

    move-result-object v1

    invoke-virtual {v1, v0}, Lc/a/a/a/x/j;->a(I)I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v1

    sub-int/2addr v0, v1

    .line 10
    invoke-virtual {p1, v0}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/x/j;->a(Landroid/widget/TextView;J)V

    :cond_28
    return-void
.end method

.method public final a(J)Z
    .registers 9

    .line 22
    iget-object v0, p0, Lc/a/a/a/x/j;->i:Lcom/google/android/material/datepicker/DateSelector;

    invoke-interface {v0}, Lcom/google/android/material/datepicker/DateSelector;->d()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    .line 23
    invoke-static {p1, p2}, Lc/a/a/a/x/p;->a(J)J

    move-result-wide v3

    invoke-static {v1, v2}, Lc/a/a/a/x/p;->a(J)J

    move-result-wide v1

    cmp-long v5, v3, v1

    if-nez v5, :cond_a

    const/4 p1, 0x1

    return p1

    :cond_28
    const/4 p1, 0x0

    return p1
.end method

.method public b()I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->e()I

    move-result v0

    iget-object v1, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v1, v1, Lcom/google/android/material/datepicker/Month;->l:I

    add-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public b(I)Z
    .registers 3

    .line 2
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->k:I

    rem-int/2addr p1, v0

    if-nez p1, :cond_9

    const/4 p1, 0x1

    goto :goto_a

    :cond_9
    const/4 p1, 0x0

    :goto_a
    return p1
.end method

.method public c(I)Z
    .registers 4

    const/4 v0, 0x1

    add-int/2addr p1, v0

    .line 1
    iget-object v1, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v1, v1, Lcom/google/android/material/datepicker/Month;->k:I

    rem-int/2addr p1, v1

    if-nez p1, :cond_a

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    :goto_b
    return v0
.end method

.method public d(I)I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->e()I

    move-result v0

    sub-int/2addr p1, v0

    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public e(I)Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/x/j;->a()I

    move-result v0

    if-lt p1, v0, :cond_e

    invoke-virtual {p0}, Lc/a/a/a/x/j;->b()I

    move-result v0

    if-gt p1, v0, :cond_e

    const/4 p1, 0x1

    goto :goto_f

    :cond_e
    const/4 p1, 0x0

    :goto_f
    return p1
.end method

.method public getCount()I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->l:I

    invoke-virtual {p0}, Lc/a/a/a/x/j;->a()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItem(I)Ljava/lang/Long;
    .registers 4

    .line 2
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/Month;->e()I

    move-result v0

    if-lt p1, v0, :cond_1e

    invoke-virtual {p0}, Lc/a/a/a/x/j;->b()I

    move-result v0

    if-le p1, v0, :cond_f

    goto :goto_1e

    .line 3
    :cond_f
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p0, p1}, Lc/a/a/a/x/j;->d(I)I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/google/android/material/datepicker/Month;->a(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    return-object p1

    :cond_1e
    :goto_1e
    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/x/j;->getItem(I)Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v0, v0, Lcom/google/android/material/datepicker/Month;->k:I

    div-int/2addr p1, v0

    int-to-long v0, p1

    return-wide v0
.end method

.method public bridge synthetic getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 4

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/x/j;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/widget/TextView;
    .registers 9

    .line 2
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc/a/a/a/x/j;->a(Landroid/content/Context;)V

    .line 3
    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x0

    if-nez p2, :cond_1e

    .line 4
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 5
    sget v0, Lc/a/a/a/h;->mtrl_calendar_day:I

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Landroid/widget/TextView;

    .line 6
    :cond_1e
    invoke-virtual {p0}, Lc/a/a/a/x/j;->a()I

    move-result p2

    sub-int p2, p1, p2

    if-ltz p2, :cond_75

    .line 7
    iget-object p3, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v2, p3, Lcom/google/android/material/datepicker/Month;->l:I

    if-lt p2, v2, :cond_2d

    goto :goto_75

    :cond_2d
    const/4 v2, 0x1

    add-int/2addr p2, v2

    .line 8
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 9
    invoke-virtual {v0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p3

    iget-object p3, p3, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    new-array v3, v2, [Ljava/lang/Object;

    .line 10
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    const-string v4, "%d"

    invoke-static {p3, v4, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    iget-object p3, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p3, p2}, Lcom/google/android/material/datepicker/Month;->a(I)J

    move-result-wide p2

    .line 12
    iget-object v3, p0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    iget v3, v3, Lcom/google/android/material/datepicker/Month;->j:I

    invoke-static {}, Lcom/google/android/material/datepicker/Month;->g()Lcom/google/android/material/datepicker/Month;

    move-result-object v4

    iget v4, v4, Lcom/google/android/material/datepicker/Month;->j:I

    if-ne v3, v4, :cond_67

    .line 13
    invoke-static {p2, p3}, Lc/a/a/a/x/d;->c(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    goto :goto_6e

    .line 14
    :cond_67
    invoke-static {p2, p3}, Lc/a/a/a/x/d;->e(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 15
    :goto_6e
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 16
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEnabled(Z)V

    goto :goto_7d

    :cond_75
    :goto_75
    const/16 p2, 0x8

    .line 17
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    .line 19
    :goto_7d
    invoke-virtual {p0, p1}, Lc/a/a/a/x/j;->getItem(I)Ljava/lang/Long;

    move-result-object p1

    if-nez p1, :cond_84

    return-object v0

    .line 20
    :cond_84
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-virtual {p0, v0, p1, p2}, Lc/a/a/a/x/j;->a(Landroid/widget/TextView;J)V

    return-object v0
.end method

.method public hasStableIds()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method
