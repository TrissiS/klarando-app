.class public final Lb/w/c/e;
.super Landroidx/recyclerview/widget/RecyclerView$s;
.source "ScrollEventAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/w/c/e$a;
    }
.end annotation


# instance fields
.field public a:Landroidx/viewpager2/widget/ViewPager2$i;

.field public final b:Landroidx/viewpager2/widget/ViewPager2;

.field public final c:Landroidx/recyclerview/widget/RecyclerView;

.field public final d:Landroidx/recyclerview/widget/LinearLayoutManager;

.field public e:I

.field public f:I

.field public g:Lb/w/c/e$a;

.field public h:I

.field public i:I

.field public j:Z

.field public k:Z

.field public l:Z

.field public m:Z


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$s;-><init>()V

    .line 2
    iput-object p1, p0, Lb/w/c/e;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 3
    iget-object p1, p1, Landroidx/viewpager2/widget/ViewPager2;->q:Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lb/w/c/e;->c:Landroidx/recyclerview/widget/RecyclerView;

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    iput-object p1, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 5
    new-instance p1, Lb/w/c/e$a;

    invoke-direct {p1}, Lb/w/c/e$a;-><init>()V

    iput-object p1, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    .line 6
    invoke-virtual {p0}, Lb/w/c/e;->h()V

    return-void
.end method


# virtual methods
.method public final a()I
    .registers 2

    .line 58
    iget-object v0, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->H()I

    move-result v0

    return v0
.end method

.method public final a(I)V
    .registers 3

    .line 54
    iget-object v0, p0, Lb/w/c/e;->a:Landroidx/viewpager2/widget/ViewPager2$i;

    if-eqz v0, :cond_7

    .line 55
    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->b(I)V

    :cond_7
    return-void
.end method

.method public final a(IFI)V
    .registers 5

    .line 56
    iget-object v0, p0, Lb/w/c/e;->a:Landroidx/viewpager2/widget/ViewPager2$i;

    if-eqz v0, :cond_7

    .line 57
    invoke-virtual {v0, p1, p2, p3}, Landroidx/viewpager2/widget/ViewPager2$i;->a(IFI)V

    :cond_7
    return-void
.end method

.method public a(IZ)V
    .registers 5

    const/4 v0, 0x2

    if-eqz p2, :cond_5

    const/4 p2, 0x2

    goto :goto_6

    :cond_5
    const/4 p2, 0x3

    .line 47
    :goto_6
    iput p2, p0, Lb/w/c/e;->e:I

    const/4 p2, 0x0

    .line 48
    iput-boolean p2, p0, Lb/w/c/e;->m:Z

    .line 49
    iget v1, p0, Lb/w/c/e;->i:I

    if-eq v1, p1, :cond_10

    const/4 p2, 0x1

    .line 50
    :cond_10
    iput p1, p0, Lb/w/c/e;->i:I

    .line 51
    invoke-virtual {p0, v0}, Lb/w/c/e;->b(I)V

    if-eqz p2, :cond_1a

    .line 52
    invoke-virtual {p0, p1}, Lb/w/c/e;->a(I)V

    :cond_1a
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 8

    .line 1
    iget p1, p0, Lb/w/c/e;->e:I

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_a

    iget p1, p0, Lb/w/c/e;->f:I

    if-eq p1, v1, :cond_10

    :cond_a
    if-ne p2, v1, :cond_10

    .line 2
    invoke-virtual {p0, v0}, Lb/w/c/e;->a(Z)V

    return-void

    .line 3
    :cond_10
    invoke-virtual {p0}, Lb/w/c/e;->f()Z

    move-result p1

    const/4 v2, 0x2

    if-eqz p1, :cond_23

    if-ne p2, v2, :cond_23

    .line 4
    iget-boolean p1, p0, Lb/w/c/e;->k:Z

    if-eqz p1, :cond_22

    .line 5
    invoke-virtual {p0, v2}, Lb/w/c/e;->b(I)V

    .line 6
    iput-boolean v1, p0, Lb/w/c/e;->j:Z

    :cond_22
    return-void

    .line 7
    :cond_23
    invoke-virtual {p0}, Lb/w/c/e;->f()Z

    move-result p1

    const/4 v3, -0x1

    if-eqz p1, :cond_57

    if-nez p2, :cond_57

    .line 8
    invoke-virtual {p0}, Lb/w/c/e;->i()V

    .line 9
    iget-boolean p1, p0, Lb/w/c/e;->k:Z

    if-nez p1, :cond_3e

    .line 10
    iget-object p1, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p1, p1, Lb/w/c/e$a;->a:I

    if-eq p1, v3, :cond_4f

    const/4 v4, 0x0

    .line 11
    invoke-virtual {p0, p1, v4, v0}, Lb/w/c/e;->a(IFI)V

    goto :goto_4f

    .line 12
    :cond_3e
    iget-object p1, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget v4, p1, Lb/w/c/e$a;->c:I

    if-nez v4, :cond_4e

    .line 13
    iget v4, p0, Lb/w/c/e;->h:I

    iget p1, p1, Lb/w/c/e$a;->a:I

    if-eq v4, p1, :cond_4f

    .line 14
    invoke-virtual {p0, p1}, Lb/w/c/e;->a(I)V

    goto :goto_4f

    :cond_4e
    const/4 v1, 0x0

    :cond_4f
    :goto_4f
    if-eqz v1, :cond_57

    .line 15
    invoke-virtual {p0, v0}, Lb/w/c/e;->b(I)V

    .line 16
    invoke-virtual {p0}, Lb/w/c/e;->h()V

    .line 17
    :cond_57
    iget p1, p0, Lb/w/c/e;->e:I

    if-ne p1, v2, :cond_7c

    if-nez p2, :cond_7c

    iget-boolean p1, p0, Lb/w/c/e;->l:Z

    if-eqz p1, :cond_7c

    .line 18
    invoke-virtual {p0}, Lb/w/c/e;->i()V

    .line 19
    iget-object p1, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p2, p1, Lb/w/c/e$a;->c:I

    if-nez p2, :cond_7c

    .line 20
    iget p2, p0, Lb/w/c/e;->i:I

    iget p1, p1, Lb/w/c/e$a;->a:I

    if-eq p2, p1, :cond_76

    if-ne p1, v3, :cond_73

    const/4 p1, 0x0

    .line 21
    :cond_73
    invoke-virtual {p0, p1}, Lb/w/c/e;->a(I)V

    .line 22
    :cond_76
    invoke-virtual {p0, v0}, Lb/w/c/e;->b(I)V

    .line 23
    invoke-virtual {p0}, Lb/w/c/e;->h()V

    :cond_7c
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 7

    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lb/w/c/e;->k:Z

    .line 25
    invoke-virtual {p0}, Lb/w/c/e;->i()V

    .line 26
    iget-boolean v0, p0, Lb/w/c/e;->j:Z

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3d

    .line 27
    iput-boolean v2, p0, Lb/w/c/e;->j:Z

    if-gtz p3, :cond_22

    if-nez p3, :cond_20

    if-gez p2, :cond_16

    const/4 p2, 0x1

    goto :goto_17

    :cond_16
    const/4 p2, 0x0

    .line 28
    :goto_17
    iget-object p3, p0, Lb/w/c/e;->b:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {p3}, Landroidx/viewpager2/widget/ViewPager2;->c()Z

    move-result p3

    if-ne p2, p3, :cond_20

    goto :goto_22

    :cond_20
    const/4 p2, 0x0

    goto :goto_23

    :cond_22
    :goto_22
    const/4 p2, 0x1

    :goto_23
    if-eqz p2, :cond_2f

    .line 29
    iget-object p2, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p3, p2, Lb/w/c/e$a;->c:I

    if-eqz p3, :cond_2f

    iget p2, p2, Lb/w/c/e$a;->a:I

    add-int/2addr p2, p1

    goto :goto_33

    :cond_2f
    iget-object p2, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p2, p2, Lb/w/c/e$a;->a:I

    :goto_33
    iput p2, p0, Lb/w/c/e;->i:I

    .line 30
    iget p3, p0, Lb/w/c/e;->h:I

    if-eq p3, p2, :cond_4b

    .line 31
    invoke-virtual {p0, p2}, Lb/w/c/e;->a(I)V

    goto :goto_4b

    .line 32
    :cond_3d
    iget p2, p0, Lb/w/c/e;->e:I

    if-nez p2, :cond_4b

    .line 33
    iget-object p2, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p2, p2, Lb/w/c/e$a;->a:I

    if-ne p2, v1, :cond_48

    const/4 p2, 0x0

    .line 34
    :cond_48
    invoke-virtual {p0, p2}, Lb/w/c/e;->a(I)V

    .line 35
    :cond_4b
    :goto_4b
    iget-object p2, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p2, p2, Lb/w/c/e$a;->a:I

    if-ne p2, v1, :cond_52

    const/4 p2, 0x0

    :cond_52
    iget-object p3, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget v0, p3, Lb/w/c/e$a;->b:F

    iget p3, p3, Lb/w/c/e$a;->c:I

    invoke-virtual {p0, p2, v0, p3}, Lb/w/c/e;->a(IFI)V

    .line 36
    iget-object p2, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p2, p2, Lb/w/c/e$a;->a:I

    iget p3, p0, Lb/w/c/e;->i:I

    if-eq p2, p3, :cond_65

    if-ne p3, v1, :cond_75

    :cond_65
    iget-object p2, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget p2, p2, Lb/w/c/e$a;->c:I

    if-nez p2, :cond_75

    iget p2, p0, Lb/w/c/e;->f:I

    if-eq p2, p1, :cond_75

    .line 37
    invoke-virtual {p0, v2}, Lb/w/c/e;->b(I)V

    .line 38
    invoke-virtual {p0}, Lb/w/c/e;->h()V

    :cond_75
    return-void
.end method

.method public a(Landroidx/viewpager2/widget/ViewPager2$i;)V
    .registers 2

    .line 53
    iput-object p1, p0, Lb/w/c/e;->a:Landroidx/viewpager2/widget/ViewPager2$i;

    return-void
.end method

.method public final a(Z)V
    .registers 4

    .line 39
    iput-boolean p1, p0, Lb/w/c/e;->m:Z

    const/4 v0, 0x1

    if-eqz p1, :cond_7

    const/4 p1, 0x4

    goto :goto_8

    :cond_7
    const/4 p1, 0x1

    .line 40
    :goto_8
    iput p1, p0, Lb/w/c/e;->e:I

    .line 41
    iget p1, p0, Lb/w/c/e;->i:I

    const/4 v1, -0x1

    if-eq p1, v1, :cond_14

    .line 42
    iput p1, p0, Lb/w/c/e;->h:I

    .line 43
    iput v1, p0, Lb/w/c/e;->i:I

    goto :goto_1e

    .line 44
    :cond_14
    iget p1, p0, Lb/w/c/e;->h:I

    if-ne p1, v1, :cond_1e

    .line 45
    invoke-virtual {p0}, Lb/w/c/e;->a()I

    move-result p1

    iput p1, p0, Lb/w/c/e;->h:I

    .line 46
    :cond_1e
    :goto_1e
    invoke-virtual {p0, v0}, Lb/w/c/e;->b(I)V

    return-void
.end method

.method public b()D
    .registers 6

    .line 1
    invoke-virtual {p0}, Lb/w/c/e;->i()V

    .line 2
    iget-object v0, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    iget v1, v0, Lb/w/c/e$a;->a:I

    int-to-double v1, v1

    iget v0, v0, Lb/w/c/e$a;->b:F

    float-to-double v3, v0

    add-double/2addr v1, v3

    return-wide v1
.end method

.method public final b(I)V
    .registers 4

    .line 3
    iget v0, p0, Lb/w/c/e;->e:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_a

    iget v0, p0, Lb/w/c/e;->f:I

    if-nez v0, :cond_a

    return-void

    .line 4
    :cond_a
    iget v0, p0, Lb/w/c/e;->f:I

    if-ne v0, p1, :cond_f

    return-void

    .line 5
    :cond_f
    iput p1, p0, Lb/w/c/e;->f:I

    .line 6
    iget-object v0, p0, Lb/w/c/e;->a:Landroidx/viewpager2/widget/ViewPager2$i;

    if-eqz v0, :cond_18

    .line 7
    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->a(I)V

    :cond_18
    return-void
.end method

.method public c()I
    .registers 2

    .line 1
    iget v0, p0, Lb/w/c/e;->f:I

    return v0
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/w/c/e;->m:Z

    return v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget v0, p0, Lb/w/c/e;->f:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public final f()Z
    .registers 4

    .line 1
    iget v0, p0, Lb/w/c/e;->e:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_a

    const/4 v2, 0x4

    if-ne v0, v2, :cond_9

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :cond_a
    :goto_a
    return v1
.end method

.method public g()V
    .registers 2

    const/4 v0, 0x1

    .line 1
    iput-boolean v0, p0, Lb/w/c/e;->l:Z

    return-void
.end method

.method public final h()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lb/w/c/e;->e:I

    .line 2
    iput v0, p0, Lb/w/c/e;->f:I

    .line 3
    iget-object v1, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    invoke-virtual {v1}, Lb/w/c/e$a;->a()V

    const/4 v1, -0x1

    .line 4
    iput v1, p0, Lb/w/c/e;->h:I

    .line 5
    iput v1, p0, Lb/w/c/e;->i:I

    .line 6
    iput-boolean v0, p0, Lb/w/c/e;->j:Z

    .line 7
    iput-boolean v0, p0, Lb/w/c/e;->k:Z

    .line 8
    iput-boolean v0, p0, Lb/w/c/e;->m:Z

    .line 9
    iput-boolean v0, p0, Lb/w/c/e;->l:Z

    return-void
.end method

.method public final i()V
    .registers 10

    .line 1
    iget-object v0, p0, Lb/w/c/e;->g:Lb/w/c/e$a;

    .line 2
    iget-object v1, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->H()I

    move-result v1

    iput v1, v0, Lb/w/c/e$a;->a:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_11

    .line 3
    invoke-virtual {v0}, Lb/w/c/e$a;->a()V

    return-void

    .line 4
    :cond_11
    iget-object v2, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(I)Landroid/view/View;

    move-result-object v1

    if-nez v1, :cond_1d

    .line 5
    invoke-virtual {v0}, Lb/w/c/e$a;->a()V

    return-void

    .line 6
    :cond_1d
    iget-object v2, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->k(Landroid/view/View;)I

    move-result v2

    .line 7
    iget-object v3, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->m(Landroid/view/View;)I

    move-result v3

    .line 8
    iget-object v4, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v4, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->n(Landroid/view/View;)I

    move-result v4

    .line 9
    iget-object v5, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v5, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(Landroid/view/View;)I

    move-result v5

    .line 10
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v6

    .line 11
    instance-of v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v7, :cond_4b

    .line 12
    check-cast v6, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 13
    iget v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v2, v7

    .line 14
    iget v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr v3, v7

    .line 15
    iget v7, v6, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr v4, v7

    .line 16
    iget v6, v6, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v5, v6

    .line 17
    :cond_4b
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v6

    add-int/2addr v6, v4

    add-int/2addr v6, v5

    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v5

    add-int/2addr v5, v2

    add-int/2addr v5, v3

    .line 19
    iget-object v3, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->O()I

    move-result v3

    const/4 v7, 0x1

    const/4 v8, 0x0

    if-nez v3, :cond_63

    const/4 v3, 0x1

    goto :goto_64

    :cond_63
    const/4 v3, 0x0

    :goto_64
    if-eqz v3, :cond_7d

    .line 20
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int/2addr v1, v2

    iget-object v2, p0, Lb/w/c/e;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    .line 21
    iget-object v2, p0, Lb/w/c/e;->b:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v2}, Landroidx/viewpager2/widget/ViewPager2;->c()Z

    move-result v2

    if-eqz v2, :cond_7b

    neg-int v1, v1

    :cond_7b
    move v6, v5

    goto :goto_89

    .line 22
    :cond_7d
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    move-result v1

    sub-int/2addr v1, v4

    iget-object v2, p0, Lb/w/c/e;->c:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getPaddingTop()I

    move-result v2

    sub-int/2addr v1, v2

    :goto_89
    neg-int v1, v1

    .line 23
    iput v1, v0, Lb/w/c/e$a;->c:I

    if-gez v1, :cond_bb

    .line 24
    new-instance v1, Lb/w/c/a;

    iget-object v2, p0, Lb/w/c/e;->d:Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v1, v2}, Lb/w/c/a;-><init>(Landroidx/recyclerview/widget/LinearLayoutManager;)V

    invoke-virtual {v1}, Lb/w/c/a;->c()Z

    move-result v1

    if-eqz v1, :cond_a3

    .line 25
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Page(s) contain a ViewGroup with a LayoutTransition (or animateLayoutChanges=\"true\"), which interferes with the scrolling animation. Make sure to call getLayoutTransition().setAnimateParentHierarchy(false) on all ViewGroups with a LayoutTransition before an animation is started."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_a3
    new-instance v1, Ljava/lang/IllegalStateException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array v3, v7, [Ljava/lang/Object;

    iget v0, v0, Lb/w/c/e$a;->c:I

    .line 27
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v8

    const-string v0, "Page can only be offset by a positive amount, not by %d"

    .line 28
    invoke-static {v2, v0, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_bb
    if-nez v6, :cond_bf

    const/4 v1, 0x0

    goto :goto_c2

    :cond_bf
    int-to-float v1, v1

    int-to-float v2, v6

    div-float/2addr v1, v2

    .line 29
    :goto_c2
    iput v1, v0, Lb/w/c/e$a;->b:F

    return-void
.end method
