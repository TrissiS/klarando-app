.class public Lc/a/a/a/x/k;
.super Landroidx/recyclerview/widget/RecyclerView$g;
.source "MonthsPagerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/x/k$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$g<",
        "Lc/a/a/a/x/k$b;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Landroid/content/Context;

.field public final k:Lcom/google/android/material/datepicker/CalendarConstraints;

.field public final l:Lcom/google/android/material/datepicker/DateSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/datepicker/DateSelector<",
            "*>;"
        }
    .end annotation
.end field

.field public final m:Lc/a/a/a/x/f$l;

.field public final n:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/google/android/material/datepicker/DateSelector;Lcom/google/android/material/datepicker/CalendarConstraints;Lc/a/a/a/x/f$l;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/android/material/datepicker/DateSelector<",
            "*>;",
            "Lcom/google/android/material/datepicker/CalendarConstraints;",
            "Lc/a/a/a/x/f$l;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$g;-><init>()V

    .line 2
    invoke-virtual {p3}, Lcom/google/android/material/datepicker/CalendarConstraints;->i()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    .line 3
    invoke-virtual {p3}, Lcom/google/android/material/datepicker/CalendarConstraints;->f()Lcom/google/android/material/datepicker/Month;

    move-result-object v1

    .line 4
    invoke-virtual {p3}, Lcom/google/android/material/datepicker/CalendarConstraints;->h()Lcom/google/android/material/datepicker/Month;

    move-result-object v2

    .line 5
    invoke-virtual {v0, v2}, Lcom/google/android/material/datepicker/Month;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result v0

    if-gtz v0, :cond_47

    .line 6
    invoke-virtual {v2, v1}, Lcom/google/android/material/datepicker/Month;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result v0

    if-gtz v0, :cond_3f

    .line 7
    sget v0, Lc/a/a/a/x/j;->m:I

    invoke-static {p1}, Lc/a/a/a/x/f;->b(Landroid/content/Context;)I

    move-result v1

    mul-int v0, v0, v1

    .line 8
    invoke-static {p1}, Lc/a/a/a/x/g;->g(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-static {p1}, Lc/a/a/a/x/f;->b(Landroid/content/Context;)I

    move-result v1

    goto :goto_2f

    :cond_2e
    const/4 v1, 0x0

    .line 9
    :goto_2f
    iput-object p1, p0, Lc/a/a/a/x/k;->j:Landroid/content/Context;

    add-int/2addr v0, v1

    .line 10
    iput v0, p0, Lc/a/a/a/x/k;->n:I

    .line 11
    iput-object p3, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    .line 12
    iput-object p2, p0, Lc/a/a/a/x/k;->l:Lcom/google/android/material/datepicker/DateSelector;

    .line 13
    iput-object p4, p0, Lc/a/a/a/x/k;->m:Lc/a/a/a/x/f$l;

    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Z)V

    return-void

    .line 15
    :cond_3f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "currentPage cannot be after lastPage"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 16
    :cond_47
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "firstPage cannot be after currentPage"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static synthetic a(Lc/a/a/a/x/k;)Lc/a/a/a/x/f$l;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/k;->m:Lc/a/a/a/x/f$l;

    return-object p0
.end method


# virtual methods
.method public a(Lcom/google/android/material/datepicker/Month;)I
    .registers 3

    .line 12
    iget-object v0, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->i()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/material/datepicker/Month;->b(Lcom/google/android/material/datepicker/Month;)I

    move-result p1

    return p1
.end method

.method public a(Lc/a/a/a/x/k$b;I)V
    .registers 6

    .line 2
    iget-object v0, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->i()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/google/android/material/datepicker/Month;->b(I)Lcom/google/android/material/datepicker/Month;

    move-result-object p2

    .line 3
    iget-object v0, p1, Lc/a/a/a/x/k$b;->A:Landroid/widget/TextView;

    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/google/android/material/datepicker/Month;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    iget-object p1, p1, Lc/a/a/a/x/k$b;->B:Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    sget v0, Lc/a/a/a/f;->month_grid:I

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/datepicker/MaterialCalendarGridView;

    .line 5
    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lc/a/a/a/x/j;

    move-result-object v0

    if-eqz v0, :cond_40

    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lc/a/a/a/x/j;

    move-result-object v0

    iget-object v0, v0, Lc/a/a/a/x/j;->h:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p2, v0}, Lcom/google/android/material/datepicker/Month;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    .line 6
    invoke-virtual {p1}, Landroid/widget/GridView;->invalidate()V

    .line 7
    invoke-virtual {p1}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->getAdapter()Lc/a/a/a/x/j;

    move-result-object p2

    invoke-virtual {p2, p1}, Lc/a/a/a/x/j;->a(Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V

    goto :goto_51

    .line 8
    :cond_40
    new-instance v0, Lc/a/a/a/x/j;

    iget-object v1, p0, Lc/a/a/a/x/k;->l:Lcom/google/android/material/datepicker/DateSelector;

    iget-object v2, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-direct {v0, p2, v1, v2}, Lc/a/a/a/x/j;-><init>(Lcom/google/android/material/datepicker/Month;Lcom/google/android/material/datepicker/DateSelector;Lcom/google/android/material/datepicker/CalendarConstraints;)V

    .line 9
    iget p2, p2, Lcom/google/android/material/datepicker/Month;->k:I

    invoke-virtual {p1, p2}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 10
    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/MaterialCalendarGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 11
    :goto_51
    new-instance p2, Lc/a/a/a/x/k$a;

    invoke-direct {p2, p0, p1}, Lc/a/a/a/x/k$a;-><init>(Lc/a/a/a/x/k;Lcom/google/android/material/datepicker/MaterialCalendarGridView;)V

    invoke-virtual {p1, p2}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method public b()I
    .registers 2

    .line 10
    iget-object v0, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->g()I

    move-result v0

    return v0
.end method

.method public b(I)J
    .registers 4

    .line 9
    iget-object v0, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->i()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/material/datepicker/Month;->b(I)Lcom/google/android/material/datepicker/Month;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/android/material/datepicker/Month;->f()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic b(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 3

    .line 2
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/x/k;->b(Landroid/view/ViewGroup;I)Lc/a/a/a/x/k$b;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/view/ViewGroup;I)Lc/a/a/a/x/k$b;
    .registers 5

    .line 3
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    sget v0, Lc/a/a/a/h;->mtrl_calendar_month_labeled:I

    const/4 v1, 0x0

    .line 4
    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lc/a/a/a/x/g;->g(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_2d

    .line 6
    new-instance p1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v0, -0x1

    iget v1, p0, Lc/a/a/a/x/k;->n:I

    invoke-direct {p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {p2, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 7
    new-instance p1, Lc/a/a/a/x/k$b;

    const/4 v0, 0x1

    invoke-direct {p1, p2, v0}, Lc/a/a/a/x/k$b;-><init>(Landroid/widget/LinearLayout;Z)V

    return-object p1

    .line 8
    :cond_2d
    new-instance p1, Lc/a/a/a/x/k$b;

    invoke-direct {p1, p2, v1}, Lc/a/a/a/x/k$b;-><init>(Landroid/widget/LinearLayout;Z)V

    return-object p1
.end method

.method public bridge synthetic b(Landroidx/recyclerview/widget/RecyclerView$b0;I)V
    .registers 3

    .line 1
    check-cast p1, Lc/a/a/a/x/k$b;

    invoke-virtual {p0, p1, p2}, Lc/a/a/a/x/k;->a(Lc/a/a/a/x/k$b;I)V

    return-void
.end method

.method public e(I)Lcom/google/android/material/datepicker/Month;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/k;->k:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->i()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/google/android/material/datepicker/Month;->b(I)Lcom/google/android/material/datepicker/Month;

    move-result-object p1

    return-object p1
.end method

.method public f(I)Ljava/lang/CharSequence;
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/x/k;->e(I)Lcom/google/android/material/datepicker/Month;

    move-result-object p1

    iget-object v0, p0, Lc/a/a/a/x/k;->j:Landroid/content/Context;

    invoke-virtual {p1, v0}, Lcom/google/android/material/datepicker/Month;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
