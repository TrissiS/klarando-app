.class public final Lc/a/a/a/x/f;
.super Lc/a/a/a/x/m;
.source "MaterialCalendar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/x/f$l;,
        Lc/a/a/a/x/f$k;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S:",
        "Ljava/lang/Object;",
        ">",
        "Lc/a/a/a/x/m<",
        "TS;>;"
    }
.end annotation


# static fields
.field public static final q0:Ljava/lang/Object;

.field public static final r0:Ljava/lang/Object;

.field public static final s0:Ljava/lang/Object;

.field public static final t0:Ljava/lang/Object;


# instance fields
.field public g0:I

.field public h0:Lcom/google/android/material/datepicker/DateSelector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/datepicker/DateSelector<",
            "TS;>;"
        }
    .end annotation
.end field

.field public i0:Lcom/google/android/material/datepicker/CalendarConstraints;

.field public j0:Lcom/google/android/material/datepicker/Month;

.field public k0:Lc/a/a/a/x/f$k;

.field public l0:Lc/a/a/a/x/b;

.field public m0:Landroidx/recyclerview/widget/RecyclerView;

.field public n0:Landroidx/recyclerview/widget/RecyclerView;

.field public o0:Landroid/view/View;

.field public p0:Landroid/view/View;


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    const-string v0, "MONTHS_VIEW_GROUP_TAG"

    .line 1
    sput-object v0, Lc/a/a/a/x/f;->q0:Ljava/lang/Object;

    const-string v0, "NAVIGATION_PREV_TAG"

    .line 2
    sput-object v0, Lc/a/a/a/x/f;->r0:Ljava/lang/Object;

    const-string v0, "NAVIGATION_NEXT_TAG"

    .line 3
    sput-object v0, Lc/a/a/a/x/f;->s0:Ljava/lang/Object;

    const-string v0, "SELECTOR_TOGGLE_TAG"

    .line 4
    sput-object v0, Lc/a/a/a/x/f;->t0:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/a/a/x/m;-><init>()V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public static a(Lcom/google/android/material/datepicker/DateSelector;ILcom/google/android/material/datepicker/CalendarConstraints;)Lc/a/a/a/x/f;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/android/material/datepicker/DateSelector<",
            "TT;>;I",
            "Lcom/google/android/material/datepicker/CalendarConstraints;",
            ")",
            "Lc/a/a/a/x/f<",
            "TT;>;"
        }
    .end annotation

    .line 3
    new-instance v0, Lc/a/a/a/x/f;

    invoke-direct {v0}, Lc/a/a/a/x/f;-><init>()V

    .line 4
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "THEME_RES_ID_KEY"

    .line 5
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "GRID_SELECTOR_KEY"

    .line 6
    invoke-virtual {v1, p1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "CALENDAR_CONSTRAINTS_KEY"

    .line 7
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 8
    invoke-virtual {p2}, Lcom/google/android/material/datepicker/CalendarConstraints;->h()Lcom/google/android/material/datepicker/Month;

    move-result-object p0

    const-string p1, "CURRENT_MONTH_KEY"

    invoke-virtual {v1, p1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 9
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->m(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public static synthetic a(Lc/a/a/a/x/f;Lcom/google/android/material/datepicker/Month;)Lcom/google/android/material/datepicker/Month;
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    return-object p1
.end method

.method public static b(Landroid/content/Context;)I
    .registers 2

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    sget v0, Lc/a/a/a/d;->mtrl_calendar_day_height:I

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/x/f;)Lcom/google/android/material/datepicker/CalendarConstraints;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/f;->i0:Lcom/google/android/material/datepicker/CalendarConstraints;

    return-object p0
.end method

.method public static synthetic c(Lc/a/a/a/x/f;)Lcom/google/android/material/datepicker/DateSelector;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/f;->h0:Lcom/google/android/material/datepicker/DateSelector;

    return-object p0
.end method

.method public static synthetic d(Lc/a/a/a/x/f;)Landroidx/recyclerview/widget/RecyclerView;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    return-object p0
.end method

.method public static synthetic e(Lc/a/a/a/x/f;)Lc/a/a/a/x/b;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/f;->l0:Lc/a/a/a/x/b;

    return-object p0
.end method

.method public static synthetic f(Lc/a/a/a/x/f;)Landroid/view/View;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/x/f;->p0:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public A0()Lc/a/a/a/x/b;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f;->l0:Lc/a/a/a/x/b;

    return-object v0
.end method

.method public B0()Lcom/google/android/material/datepicker/Month;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    return-object v0
.end method

.method public C0()Lcom/google/android/material/datepicker/DateSelector;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/material/datepicker/DateSelector<",
            "TS;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f;->h0:Lcom/google/android/material/datepicker/DateSelector;

    return-object v0
.end method

.method public D0()Landroidx/recyclerview/widget/LinearLayoutManager;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    return-object v0
.end method

.method public E0()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f;->k0:Lc/a/a/a/x/f$k;

    sget-object v1, Lc/a/a/a/x/f$k;->YEAR:Lc/a/a/a/x/f$k;

    if-ne v0, v1, :cond_c

    .line 2
    sget-object v0, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    invoke-virtual {p0, v0}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f$k;)V

    goto :goto_15

    .line 3
    :cond_c
    sget-object v1, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    if-ne v0, v1, :cond_15

    .line 4
    sget-object v0, Lc/a/a/a/x/f$k;->YEAR:Lc/a/a/a/x/f$k;

    invoke-virtual {p0, v0}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f$k;)V

    :cond_15
    :goto_15
    return-void
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 14

    .line 10
    new-instance p3, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lc/a/a/a/x/f;->g0:I

    invoke-direct {p3, v0, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    .line 11
    new-instance v0, Lc/a/a/a/x/b;

    invoke-direct {v0, p3}, Lc/a/a/a/x/b;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lc/a/a/a/x/f;->l0:Lc/a/a/a/x/b;

    .line 12
    invoke-virtual {p1, p3}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    .line 13
    iget-object v0, p0, Lc/a/a/a/x/f;->i0:Lcom/google/android/material/datepicker/CalendarConstraints;

    invoke-virtual {v0}, Lcom/google/android/material/datepicker/CalendarConstraints;->i()Lcom/google/android/material/datepicker/Month;

    move-result-object v0

    .line 14
    invoke-static {p3}, Lc/a/a/a/x/g;->g(Landroid/content/Context;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_28

    .line 15
    sget v1, Lc/a/a/a/h;->mtrl_calendar_vertical:I

    const/4 v9, 0x1

    goto :goto_2b

    .line 16
    :cond_28
    sget v1, Lc/a/a/a/h;->mtrl_calendar_horizontal:I

    const/4 v9, 0x0

    .line 17
    :goto_2b
    invoke-virtual {p1, v1, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 18
    sget p2, Lc/a/a/a/f;->mtrl_calendar_days_of_week:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/GridView;

    .line 19
    new-instance v1, Lc/a/a/a/x/f$b;

    invoke-direct {v1, p0}, Lc/a/a/a/x/f$b;-><init>(Lc/a/a/a/x/f;)V

    invoke-static {p2, v1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    .line 20
    new-instance v1, Lc/a/a/a/x/e;

    invoke-direct {v1}, Lc/a/a/a/x/e;-><init>()V

    invoke-virtual {p2, v1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 21
    iget v0, v0, Lcom/google/android/material/datepicker/Month;->k:I

    invoke-virtual {p2, v0}, Landroid/widget/GridView;->setNumColumns(I)V

    .line 22
    invoke-virtual {p2, v3}, Landroid/widget/GridView;->setEnabled(Z)V

    .line 23
    sget p2, Lc/a/a/a/f;->mtrl_calendar_months:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p2, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    .line 24
    new-instance p2, Lc/a/a/a/x/f$c;

    .line 25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v6

    const/4 v8, 0x0

    move-object v4, p2

    move-object v5, p0

    move v7, v9

    invoke-direct/range {v4 .. v9}, Lc/a/a/a/x/f$c;-><init>(Lc/a/a/a/x/f;Landroid/content/Context;IZI)V

    .line 26
    iget-object v0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 27
    iget-object p2, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    sget-object v0, Lc/a/a/a/x/f;->q0:Ljava/lang/Object;

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->setTag(Ljava/lang/Object;)V

    .line 28
    new-instance p2, Lc/a/a/a/x/k;

    iget-object v0, p0, Lc/a/a/a/x/f;->h0:Lcom/google/android/material/datepicker/DateSelector;

    iget-object v1, p0, Lc/a/a/a/x/f;->i0:Lcom/google/android/material/datepicker/CalendarConstraints;

    new-instance v4, Lc/a/a/a/x/f$d;

    invoke-direct {v4, p0}, Lc/a/a/a/x/f$d;-><init>(Lc/a/a/a/x/f;)V

    invoke-direct {p2, p3, v0, v1, v4}, Lc/a/a/a/x/k;-><init>(Landroid/content/Context;Lcom/google/android/material/datepicker/DateSelector;Lcom/google/android/material/datepicker/CalendarConstraints;Lc/a/a/a/x/f$l;)V

    .line 29
    iget-object v0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p2}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V

    .line 30
    invoke-virtual {p3}, Landroid/view/ContextThemeWrapper;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Lc/a/a/a/g;->mtrl_calendar_year_selector_span:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v0

    .line 31
    sget v1, Lc/a/a/a/f;->mtrl_calendar_year_selector_frame:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v1, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_bb

    .line 32
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 33
    iget-object v1, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Landroidx/recyclerview/widget/GridLayoutManager;

    invoke-direct {v4, p3, v0, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;IIZ)V

    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 34
    iget-object v0, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lc/a/a/a/x/q;

    invoke-direct {v1, p0}, Lc/a/a/a/x/q;-><init>(Lc/a/a/a/x/f;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V

    .line 35
    iget-object v0, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Lc/a/a/a/x/f;->y0()Landroidx/recyclerview/widget/RecyclerView$n;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 36
    :cond_bb
    sget v0, Lc/a/a/a/f;->month_navigation_fragment_toggle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_c6

    .line 37
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/x/f;->a(Landroid/view/View;Lc/a/a/a/x/k;)V

    .line 38
    :cond_c6
    invoke-static {p3}, Lc/a/a/a/x/g;->g(Landroid/content/Context;)Z

    move-result p3

    if-nez p3, :cond_d6

    .line 39
    new-instance p3, Lb/p/d/j;

    invoke-direct {p3}, Lb/p/d/j;-><init>()V

    iget-object v0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3, v0}, Lb/p/d/n;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 40
    :cond_d6
    iget-object p3, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p2, v0}, Lc/a/a/a/x/k;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result p2

    invoke-virtual {p3, p2}, Landroidx/recyclerview/widget/RecyclerView;->g(I)V

    return-object p1
.end method

.method public final a(Landroid/view/View;Lc/a/a/a/x/k;)V
    .registers 7

    .line 63
    sget v0, Lc/a/a/a/f;->month_navigation_fragment_toggle:I

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    .line 64
    sget-object v1, Lc/a/a/a/x/f;->t0:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 65
    new-instance v1, Lc/a/a/a/x/f$f;

    invoke-direct {v1, p0}, Lc/a/a/a/x/f$f;-><init>(Lc/a/a/a/x/f;)V

    invoke-static {v0, v1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/a;)V

    .line 66
    sget v1, Lc/a/a/a/f;->month_navigation_previous:I

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    .line 67
    sget-object v2, Lc/a/a/a/x/f;->r0:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 68
    sget v2, Lc/a/a/a/f;->month_navigation_next:I

    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    .line 69
    sget-object v3, Lc/a/a/a/x/f;->s0:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 70
    sget v3, Lc/a/a/a/f;->mtrl_calendar_year_selector_frame:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lc/a/a/a/x/f;->o0:Landroid/view/View;

    .line 71
    sget v3, Lc/a/a/a/f;->mtrl_calendar_day_selector_frame:I

    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lc/a/a/a/x/f;->p0:Landroid/view/View;

    .line 72
    sget-object v3, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    invoke-virtual {p0, v3}, Lc/a/a/a/x/f;->a(Lc/a/a/a/x/f$k;)V

    .line 73
    iget-object v3, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {v3, p1}, Lcom/google/android/material/datepicker/Month;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 74
    iget-object p1, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v3, Lc/a/a/a/x/f$g;

    invoke-direct {v3, p0, p2, v0}, Lc/a/a/a/x/f$g;-><init>(Lc/a/a/a/x/f;Lc/a/a/a/x/k;Lcom/google/android/material/button/MaterialButton;)V

    invoke-virtual {p1, v3}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 75
    new-instance p1, Lc/a/a/a/x/f$h;

    invoke-direct {p1, p0}, Lc/a/a/a/x/f$h;-><init>(Lc/a/a/a/x/f;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 76
    new-instance p1, Lc/a/a/a/x/f$i;

    invoke-direct {p1, p0, p2}, Lc/a/a/a/x/f$i;-><init>(Lc/a/a/a/x/f;Lc/a/a/a/x/k;)V

    invoke-virtual {v2, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    new-instance p1, Lc/a/a/a/x/f$j;

    invoke-direct {p1, p0, p2}, Lc/a/a/a/x/f$j;-><init>(Lc/a/a/a/x/f;Lc/a/a/a/x/k;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public a(Lc/a/a/a/x/f$k;)V
    .registers 6

    .line 51
    iput-object p1, p0, Lc/a/a/a/x/f;->k0:Lc/a/a/a/x/f$k;

    .line 52
    sget-object v0, Lc/a/a/a/x/f$k;->YEAR:Lc/a/a/a/x/f$k;

    const/16 v1, 0x8

    const/4 v2, 0x0

    if-ne p1, v0, :cond_2d

    .line 53
    iget-object p1, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    .line 54
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    iget-object v0, p0, Lc/a/a/a/x/f;->m0:Landroidx/recyclerview/widget/RecyclerView;

    .line 55
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    check-cast v0, Lc/a/a/a/x/q;

    iget-object v3, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    iget v3, v3, Lcom/google/android/material/datepicker/Month;->j:I

    invoke-virtual {v0, v3}, Lc/a/a/a/x/q;->f(I)I

    move-result v0

    .line 56
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->i(I)V

    .line 57
    iget-object p1, p0, Lc/a/a/a/x/f;->o0:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 58
    iget-object p1, p0, Lc/a/a/a/x/f;->p0:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_40

    .line 59
    :cond_2d
    sget-object v0, Lc/a/a/a/x/f$k;->DAY:Lc/a/a/a/x/f$k;

    if-ne p1, v0, :cond_40

    .line 60
    iget-object p1, p0, Lc/a/a/a/x/f;->o0:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    iget-object p1, p0, Lc/a/a/a/x/f;->p0:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 62
    iget-object p1, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {p0, p1}, Lc/a/a/a/x/f;->a(Lcom/google/android/material/datepicker/Month;)V

    :cond_40
    :goto_40
    return-void
.end method

.method public a(Lcom/google/android/material/datepicker/Month;)V
    .registers 8

    .line 41
    iget-object v0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;

    move-result-object v0

    check-cast v0, Lc/a/a/a/x/k;

    .line 42
    invoke-virtual {v0, p1}, Lc/a/a/a/x/k;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result v1

    .line 43
    iget-object v2, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    invoke-virtual {v0, v2}, Lc/a/a/a/x/k;->a(Lcom/google/android/material/datepicker/Month;)I

    move-result v0

    sub-int v0, v1, v0

    .line 44
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-le v2, v5, :cond_1f

    const/4 v2, 0x1

    goto :goto_20

    :cond_1f
    const/4 v2, 0x0

    :goto_20
    if-lez v0, :cond_23

    goto :goto_24

    :cond_23
    const/4 v3, 0x0

    .line 45
    :goto_24
    iput-object p1, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    if-eqz v2, :cond_35

    if-eqz v3, :cond_35

    .line 46
    iget-object p1, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    add-int/lit8 v0, v1, -0x3

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->g(I)V

    .line 47
    invoke-virtual {p0, v1}, Lc/a/a/a/x/f;->c(I)V

    goto :goto_45

    :cond_35
    if-eqz v2, :cond_42

    .line 48
    iget-object p1, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    add-int/lit8 v0, v1, 0x3

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->g(I)V

    .line 49
    invoke-virtual {p0, v1}, Lc/a/a/a/x/f;->c(I)V

    goto :goto_45

    .line 50
    :cond_42
    invoke-virtual {p0, v1}, Lc/a/a/a/x/f;->c(I)V

    :goto_45
    return-void
.end method

.method public a(Lc/a/a/a/x/l;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lc/a/a/a/x/l<",
            "TS;>;)Z"
        }
    .end annotation

    .line 78
    invoke-super {p0, p1}, Lc/a/a/a/x/m;->a(Lc/a/a/a/x/l;)Z

    move-result p1

    return p1
.end method

.method public final c(I)V
    .registers 4

    .line 8
    iget-object v0, p0, Lc/a/a/a/x/f;->n0:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lc/a/a/a/x/f$a;

    invoke-direct {v1, p0, p1}, Lc/a/a/a/x/f$a;-><init>(Lc/a/a/a/x/f;I)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public c(Landroid/os/Bundle;)V
    .registers 3

    .line 2
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->c(Landroid/os/Bundle;)V

    if-nez p1, :cond_9

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->n()Landroid/os/Bundle;

    move-result-object p1

    :cond_9
    const-string v0, "THEME_RES_ID_KEY"

    .line 4
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lc/a/a/a/x/f;->g0:I

    const-string v0, "GRID_SELECTOR_KEY"

    .line 5
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/DateSelector;

    iput-object v0, p0, Lc/a/a/a/x/f;->h0:Lcom/google/android/material/datepicker/DateSelector;

    const-string v0, "CALENDAR_CONSTRAINTS_KEY"

    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/google/android/material/datepicker/CalendarConstraints;

    iput-object v0, p0, Lc/a/a/a/x/f;->i0:Lcom/google/android/material/datepicker/CalendarConstraints;

    const-string v0, "CURRENT_MONTH_KEY"

    .line 7
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/datepicker/Month;

    iput-object p1, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    return-void
.end method

.method public e(Landroid/os/Bundle;)V
    .registers 4

    .line 2
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->e(Landroid/os/Bundle;)V

    .line 3
    iget v0, p0, Lc/a/a/a/x/f;->g0:I

    const-string v1, "THEME_RES_ID_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 4
    iget-object v0, p0, Lc/a/a/a/x/f;->h0:Lcom/google/android/material/datepicker/DateSelector;

    const-string v1, "GRID_SELECTOR_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 5
    iget-object v0, p0, Lc/a/a/a/x/f;->i0:Lcom/google/android/material/datepicker/CalendarConstraints;

    const-string v1, "CALENDAR_CONSTRAINTS_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 6
    iget-object v0, p0, Lc/a/a/a/x/f;->j0:Lcom/google/android/material/datepicker/Month;

    const-string v1, "CURRENT_MONTH_KEY"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-void
.end method

.method public final y0()Landroidx/recyclerview/widget/RecyclerView$n;
    .registers 2

    .line 1
    new-instance v0, Lc/a/a/a/x/f$e;

    invoke-direct {v0, p0}, Lc/a/a/a/x/f$e;-><init>(Lc/a/a/a/x/f;)V

    return-object v0
.end method

.method public z0()Lcom/google/android/material/datepicker/CalendarConstraints;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/x/f;->i0:Lcom/google/android/material/datepicker/CalendarConstraints;

    return-object v0
.end method
