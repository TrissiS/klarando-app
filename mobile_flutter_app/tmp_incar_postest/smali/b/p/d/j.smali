.class public Lb/p/d/j;
.super Lb/p/d/n;
.source "PagerSnapHelper.java"


# instance fields
.field public c:Lb/p/d/i;

.field public d:Lb/p/d/i;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lb/p/d/n;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView$o;II)I
    .registers 15

    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->j()I

    move-result v0

    const/4 v1, -0x1

    if-nez v0, :cond_8

    return v1

    .line 8
    :cond_8
    invoke-virtual {p0, p1}, Lb/p/d/j;->e(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object v2

    if-nez v2, :cond_f

    return v1

    :cond_f
    const/high16 v3, -0x80000000

    const v4, 0x7fffffff

    .line 9
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v8, v7

    :goto_1b
    if-ge v6, v5, :cond_37

    .line 10
    invoke-virtual {p1, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v9

    if-nez v9, :cond_24

    goto :goto_34

    .line 11
    :cond_24
    invoke-virtual {p0, p1, v9, v2}, Lb/p/d/j;->a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;Lb/p/d/i;)I

    move-result v10

    if-gtz v10, :cond_2e

    if-le v10, v3, :cond_2e

    move-object v8, v9

    move v3, v10

    :cond_2e
    if-ltz v10, :cond_34

    if-ge v10, v4, :cond_34

    move-object v7, v9

    move v4, v10

    :cond_34
    :goto_34
    add-int/lit8 v6, v6, 0x1

    goto :goto_1b

    .line 12
    :cond_37
    invoke-virtual {p0, p1, p2, p3}, Lb/p/d/j;->c(Landroidx/recyclerview/widget/RecyclerView$o;II)Z

    move-result p2

    if-eqz p2, :cond_44

    if-eqz v7, :cond_44

    .line 13
    invoke-virtual {p1, v7}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result p1

    return p1

    :cond_44
    if-nez p2, :cond_4d

    if-eqz v8, :cond_4d

    .line 14
    invoke-virtual {p1, v8}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result p1

    return p1

    :cond_4d
    if-eqz p2, :cond_50

    move-object v7, v8

    :cond_50
    if-nez v7, :cond_53

    return v1

    .line 15
    :cond_53
    invoke-virtual {p1, v7}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result p3

    .line 16
    invoke-virtual {p0, p1}, Lb/p/d/j;->g(Landroidx/recyclerview/widget/RecyclerView$o;)Z

    move-result p1

    if-ne p1, p2, :cond_5f

    const/4 p1, -0x1

    goto :goto_60

    :cond_5f
    const/4 p1, 0x1

    :goto_60
    add-int/2addr p3, p1

    if-ltz p3, :cond_67

    if-lt p3, v0, :cond_66

    goto :goto_67

    :cond_66
    return p3

    :cond_67
    :goto_67
    return v1
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;Lb/p/d/i;)I
    .registers 4

    .line 17
    invoke-virtual {p3, p2}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result p1

    .line 18
    invoke-virtual {p3, p2}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    add-int/2addr p1, p2

    .line 19
    invoke-virtual {p3}, Lb/p/d/i;->f()I

    move-result p2

    invoke-virtual {p3}, Lb/p/d/i;->g()I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    add-int/2addr p2, p3

    sub-int/2addr p1, p2

    return p1
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$o;Lb/p/d/i;)Landroid/view/View;
    .registers 11

    .line 20
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 21
    :cond_8
    invoke-virtual {p2}, Lb/p/d/i;->f()I

    move-result v2

    invoke-virtual {p2}, Lb/p/d/i;->g()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v2, v3

    const v3, 0x7fffffff

    const/4 v4, 0x0

    :goto_17
    if-ge v4, v0, :cond_34

    .line 22
    invoke-virtual {p1, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v5

    .line 23
    invoke-virtual {p2, v5}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v6

    .line 24
    invoke-virtual {p2, v5}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v7

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v6, v7

    sub-int/2addr v6, v2

    .line 25
    invoke-static {v6}, Ljava/lang/Math;->abs(I)I

    move-result v6

    if-ge v6, v3, :cond_31

    move-object v1, v5

    move v3, v6

    :cond_31
    add-int/lit8 v4, v4, 0x1

    goto :goto_17

    :cond_34
    return-object v1
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;)[I
    .registers 7

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_15

    .line 2
    invoke-virtual {p0, p1}, Lb/p/d/j;->d(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object v1

    .line 3
    invoke-virtual {p0, p1, p2, v1}, Lb/p/d/j;->a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;Lb/p/d/i;)I

    move-result v1

    aput v1, v0, v2

    goto :goto_17

    :cond_15
    aput v2, v0, v2

    .line 4
    :goto_17
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->b()Z

    move-result v1

    const/4 v3, 0x1

    if-eqz v1, :cond_29

    .line 5
    invoke-virtual {p0, p1}, Lb/p/d/j;->f(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object v1

    .line 6
    invoke-virtual {p0, p1, p2, v1}, Lb/p/d/j;->a(Landroidx/recyclerview/widget/RecyclerView$o;Landroid/view/View;Lb/p/d/i;)I

    move-result p1

    aput p1, v0, v3

    goto :goto_2b

    :cond_29
    aput v2, v0, v3

    :goto_2b
    return-object v0
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/g;
    .registers 3

    .line 1
    instance-of p1, p1, Landroidx/recyclerview/widget/RecyclerView$x$b;

    if-nez p1, :cond_6

    const/4 p1, 0x0

    return-object p1

    .line 2
    :cond_6
    new-instance p1, Lb/p/d/j$a;

    iget-object v0, p0, Lb/p/d/n;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lb/p/d/j$a;-><init>(Lb/p/d/j;Landroid/content/Context;)V

    return-object p1
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->b()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    invoke-virtual {p0, p1}, Lb/p/d/j;->f(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lb/p/d/j;->a(Landroidx/recyclerview/widget/RecyclerView$o;Lb/p/d/i;)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 3
    :cond_f
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 4
    invoke-virtual {p0, p1}, Lb/p/d/j;->d(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lb/p/d/j;->a(Landroidx/recyclerview/widget/RecyclerView$o;Lb/p/d/i;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_1e
    const/4 p1, 0x0

    return-object p1
.end method

.method public final c(Landroidx/recyclerview/widget/RecyclerView$o;II)Z
    .registers 6

    .line 5
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a()Z

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_d

    if-lez p2, :cond_b

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0

    :cond_d
    if-lez p3, :cond_10

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public final d(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/j;->d:Lb/p/d/i;

    if-eqz v0, :cond_8

    iget-object v0, v0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    if-eq v0, p1, :cond_e

    .line 2
    :cond_8
    invoke-static {p1}, Lb/p/d/i;->a(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object p1

    iput-object p1, p0, Lb/p/d/j;->d:Lb/p/d/i;

    .line 3
    :cond_e
    iget-object p1, p0, Lb/p/d/j;->d:Lb/p/d/i;

    return-object p1
.end method

.method public final e(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->b()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 2
    invoke-virtual {p0, p1}, Lb/p/d/j;->f(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object p1

    return-object p1

    .line 3
    :cond_b
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 4
    invoke-virtual {p0, p1}, Lb/p/d/j;->d(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object p1

    return-object p1

    :cond_16
    const/4 p1, 0x0

    return-object p1
.end method

.method public final f(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/j;->c:Lb/p/d/i;

    if-eqz v0, :cond_8

    iget-object v0, v0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    if-eq v0, p1, :cond_e

    .line 2
    :cond_8
    invoke-static {p1}, Lb/p/d/i;->b(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;

    move-result-object p1

    iput-object p1, p0, Lb/p/d/j;->c:Lb/p/d/i;

    .line 3
    :cond_e
    iget-object p1, p0, Lb/p/d/j;->c:Lb/p/d/i;

    return-object p1
.end method

.method public final g(Landroidx/recyclerview/widget/RecyclerView$o;)Z
    .registers 6

    .line 1
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->j()I

    move-result v0

    .line 2
    instance-of v1, p1, Landroidx/recyclerview/widget/RecyclerView$x$b;

    const/4 v2, 0x0

    if-eqz v1, :cond_21

    .line 3
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$x$b;

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 4
    invoke-interface {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$x$b;->a(I)Landroid/graphics/PointF;

    move-result-object p1

    if-eqz p1, :cond_21

    .line 5
    iget v0, p1, Landroid/graphics/PointF;->x:F

    const/4 v3, 0x0

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_20

    iget p1, p1, Landroid/graphics/PointF;->y:F

    cmpg-float p1, p1, v3

    if-gez p1, :cond_21

    :cond_20
    const/4 v2, 0x1

    :cond_21
    return v2
.end method
