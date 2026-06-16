.class public Landroidx/recyclerview/widget/StaggeredGridLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "StaggeredGridLayoutManager.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$x$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;,
        Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;,
        Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;,
        Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;,
        Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;
    }
.end annotation


# instance fields
.field public A:Z

.field public B:Ljava/util/BitSet;

.field public C:I

.field public D:I

.field public E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

.field public F:I

.field public G:Z

.field public H:Z

.field public I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

.field public J:I

.field public final K:Landroid/graphics/Rect;

.field public final L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

.field public M:Z

.field public N:Z

.field public O:[I

.field public final P:Ljava/lang/Runnable;

.field public s:I

.field public t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

.field public u:Lb/p/d/i;

.field public v:Lb/p/d/i;

.field public w:I

.field public x:I

.field public final y:Lb/p/d/f;

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    const/4 v1, 0x0

    .line 3
    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:Z

    .line 4
    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    .line 5
    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    const/high16 v0, -0x80000000

    .line 6
    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    .line 7
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-direct {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v0, 0x2

    .line 8
    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F:I

    .line 9
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K:Landroid/graphics/Rect;

    .line 10
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    .line 11
    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    .line 13
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$a;

    invoke-direct {v0, p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$a;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager;)V

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P:Ljava/lang/Runnable;

    .line 14
    invoke-static {p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroidx/recyclerview/widget/RecyclerView$o$d;

    move-result-object p1

    .line 15
    iget p2, p1, Landroidx/recyclerview/widget/RecyclerView$o$d;->a:I

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v(I)V

    .line 16
    iget p2, p1, Landroidx/recyclerview/widget/RecyclerView$o$d;->b:I

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w(I)V

    .line 17
    iget-boolean p1, p1, Landroidx/recyclerview/widget/RecyclerView$o$d;->c:Z

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(Z)V

    .line 18
    new-instance p1, Lb/p/d/f;

    invoke-direct {p1}, Lb/p/d/f;-><init>()V

    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    .line 19
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H()V

    return-void
.end method


# virtual methods
.method public D()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public E()Z
    .registers 7

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v0

    const/4 v3, 0x1

    const/4 v4, 0x1

    .line 2
    :goto_d
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v4, v5, :cond_1f

    .line 3
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v4

    invoke-virtual {v5, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v5

    if-eq v5, v0, :cond_1c

    return v1

    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_1f
    return v3
.end method

.method public F()Z
    .registers 7

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v0

    const/4 v3, 0x1

    const/4 v4, 0x1

    .line 2
    :goto_d
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v4, v5, :cond_1f

    .line 3
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v4

    invoke-virtual {v5, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v5

    if-eq v5, v0, :cond_1c

    return v1

    :cond_1c
    add-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_1f
    return v3
.end method

.method public G()Z
    .registers 8

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_7d

    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F:I

    if-eqz v0, :cond_7d

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->u()Z

    move-result v0

    if-nez v0, :cond_12

    goto :goto_7d

    .line 2
    :cond_12
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v0, :cond_1f

    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v0

    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v2

    goto :goto_27

    .line 5
    :cond_1f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v0

    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v2

    :goto_27
    const/4 v3, 0x1

    if-nez v0, :cond_3c

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_3c

    .line 8
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a()V

    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->A()V

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return v3

    .line 11
    :cond_3c
    iget-boolean v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    if-nez v4, :cond_41

    return v1

    .line 12
    :cond_41
    iget-boolean v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    const/4 v5, -0x1

    if-eqz v4, :cond_48

    const/4 v4, -0x1

    goto :goto_49

    :cond_48
    const/4 v4, 0x1

    .line 13
    :goto_49
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    add-int/2addr v2, v3

    .line 14
    invoke-virtual {v6, v0, v2, v4, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(IIIZ)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v6

    if-nez v6, :cond_5a

    .line 15
    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    .line 16
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b(I)I

    return v1

    .line 17
    :cond_5a
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v2, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->h:I

    mul-int/lit8 v4, v4, -0x1

    .line 18
    invoke-virtual {v1, v0, v2, v4, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(IIIZ)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v0

    if-nez v0, :cond_6e

    .line 19
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->h:I

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b(I)I

    goto :goto_76

    .line 20
    :cond_6e
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget v0, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->h:I

    add-int/2addr v0, v3

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b(I)I

    .line 21
    :goto_76
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->A()V

    .line 22
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return v3

    :cond_7d
    :goto_7d
    return v1
.end method

.method public final H()V
    .registers 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    invoke-static {p0, v0}, Lb/p/d/i;->a(Landroidx/recyclerview/widget/RecyclerView$o;I)Lb/p/d/i;

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 2
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    rsub-int/lit8 v0, v0, 0x1

    .line 3
    invoke-static {p0, v0}, Lb/p/d/i;->a(Landroidx/recyclerview/widget/RecyclerView$o;I)Lb/p/d/i;

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    return-void
.end method

.method public I()I
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_a

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Z)Landroid/view/View;

    move-result-object v0

    goto :goto_e

    .line 2
    :cond_a
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Z)Landroid/view/View;

    move-result-object v0

    :goto_e
    if-nez v0, :cond_12

    const/4 v0, -0x1

    goto :goto_16

    .line 3
    :cond_12
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    :goto_16
    return v0
.end method

.method public J()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    goto :goto_10

    .line 2
    :cond_8
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    :goto_10
    return v1
.end method

.method public K()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    goto :goto_12

    :cond_8
    add-int/lit8 v0, v0, -0x1

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    :goto_12
    return v0
.end method

.method public L()Landroid/view/View;
    .registers 13

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    .line 2
    new-instance v2, Ljava/util/BitSet;

    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    invoke-direct {v2, v3}, Ljava/util/BitSet;-><init>(I)V

    .line 3
    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    const/4 v4, 0x0

    invoke-virtual {v2, v4, v3, v1}, Ljava/util/BitSet;->set(IIZ)V

    .line 4
    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v5, -0x1

    if-ne v3, v1, :cond_20

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result v3

    if-eqz v3, :cond_20

    const/4 v3, 0x1

    goto :goto_21

    :cond_20
    const/4 v3, -0x1

    .line 5
    :goto_21
    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v6, :cond_27

    const/4 v6, -0x1

    goto :goto_2b

    :cond_27
    add-int/lit8 v0, v0, 0x1

    move v6, v0

    const/4 v0, 0x0

    :goto_2b
    if-ge v0, v6, :cond_2e

    const/4 v5, 0x1

    :cond_2e
    :goto_2e
    if-eq v0, v6, :cond_ab

    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v7

    .line 7
    invoke-virtual {v7}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 8
    iget-object v9, v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget v9, v9, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    invoke-virtual {v2, v9}, Ljava/util/BitSet;->get(I)Z

    move-result v9

    if-eqz v9, :cond_54

    .line 9
    iget-object v9, v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-virtual {p0, v9}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)Z

    move-result v9

    if-eqz v9, :cond_4d

    return-object v7

    .line 10
    :cond_4d
    iget-object v9, v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget v9, v9, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    invoke-virtual {v2, v9}, Ljava/util/BitSet;->clear(I)V

    .line 11
    :cond_54
    iget-boolean v9, v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v9, :cond_59

    goto :goto_a9

    :cond_59
    add-int v9, v0, v5

    if-eq v9, v6, :cond_a9

    .line 12
    invoke-virtual {p0, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v9

    .line 13
    iget-boolean v10, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v10, :cond_77

    .line 14
    iget-object v10, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v10, v7}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v10

    .line 15
    iget-object v11, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v11, v9}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v11

    if-ge v10, v11, :cond_74

    return-object v7

    :cond_74
    if-ne v10, v11, :cond_8a

    goto :goto_88

    .line 16
    :cond_77
    iget-object v10, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v10, v7}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v10

    .line 17
    iget-object v11, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v11, v9}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v11

    if-le v10, v11, :cond_86

    return-object v7

    :cond_86
    if-ne v10, v11, :cond_8a

    :goto_88
    const/4 v10, 0x1

    goto :goto_8b

    :cond_8a
    const/4 v10, 0x0

    :goto_8b
    if-eqz v10, :cond_a9

    .line 18
    invoke-virtual {v9}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v9

    check-cast v9, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 19
    iget-object v8, v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget v8, v8, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    iget-object v9, v9, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget v9, v9, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    sub-int/2addr v8, v9

    if-gez v8, :cond_a0

    const/4 v8, 0x1

    goto :goto_a1

    :cond_a0
    const/4 v8, 0x0

    :goto_a1
    if-gez v3, :cond_a5

    const/4 v9, 0x1

    goto :goto_a6

    :cond_a5
    const/4 v9, 0x0

    :goto_a6
    if-eq v8, v9, :cond_a9

    return-object v7

    :cond_a9
    :goto_a9
    add-int/2addr v0, v5

    goto :goto_2e

    :cond_ab
    const/4 v0, 0x0

    return-object v0
.end method

.method public M()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a()V

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public N()Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->k()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    :goto_9
    return v1
.end method

.method public final O()V
    .registers 10

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->d()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_b

    return-void

    :cond_b
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_12
    if-ge v3, v1, :cond_3f

    .line 3
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v4

    .line 4
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v5, v4}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v5

    int-to-float v5, v5

    cmpg-float v6, v5, v0

    if-gez v6, :cond_24

    goto :goto_3c

    .line 5
    :cond_24
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 6
    invoke-virtual {v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f()Z

    move-result v4

    if-eqz v4, :cond_38

    const/high16 v4, 0x3f800000    # 1.0f

    mul-float v5, v5, v4

    .line 7
    iget v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    int-to-float v4, v4

    div-float/2addr v5, v4

    .line 8
    :cond_38
    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :goto_3c
    add-int/lit8 v3, v3, 0x1

    goto :goto_12

    .line 9
    :cond_3f
    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    .line 10
    iget v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    int-to-float v4, v4

    mul-float v0, v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 11
    iget-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v4}, Lb/p/d/i;->d()I

    move-result v4

    const/high16 v5, -0x80000000

    if-ne v4, v5, :cond_5e

    .line 12
    iget-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v4}, Lb/p/d/i;->g()I

    move-result v4

    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 13
    :cond_5e
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x(I)V

    .line 14
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    if-ne v0, v3, :cond_66

    return-void

    :cond_66
    :goto_66
    if-ge v2, v1, :cond_b4

    .line 15
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 17
    iget-boolean v5, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v5, :cond_77

    goto :goto_b1

    .line 18
    :cond_77
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result v5

    const/4 v6, 0x1

    if-eqz v5, :cond_9a

    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne v5, v6, :cond_9a

    .line 19
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    add-int/lit8 v7, v5, -0x1

    iget-object v4, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget v4, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    sub-int/2addr v7, v4

    neg-int v7, v7

    iget v8, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    mul-int v7, v7, v8

    sub-int/2addr v5, v6

    sub-int/2addr v5, v4

    neg-int v4, v5

    mul-int v4, v4, v3

    sub-int/2addr v7, v4

    .line 20
    invoke-virtual {v0, v7}, Landroid/view/View;->offsetLeftAndRight(I)V

    goto :goto_b1

    .line 21
    :cond_9a
    iget-object v4, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget v4, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    mul-int v5, v5, v4

    mul-int v4, v4, v3

    .line 22
    iget v7, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne v7, v6, :cond_ad

    sub-int/2addr v5, v4

    .line 23
    invoke-virtual {v0, v5}, Landroid/view/View;->offsetLeftAndRight(I)V

    goto :goto_b1

    :cond_ad
    sub-int/2addr v5, v4

    .line 24
    invoke-virtual {v0, v5}, Landroid/view/View;->offsetTopAndBottom(I)V

    :goto_b1
    add-int/lit8 v2, v2, 0x1

    goto :goto_66

    :cond_b4
    return-void
.end method

.method public final P()V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_12

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_12

    .line 2
    :cond_c
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    goto :goto_16

    .line 3
    :cond_12
    :goto_12
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:Z

    iput-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    :goto_16
    return-void
.end method

.method public a(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 4

    .line 251
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 5

    .line 110
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_8

    .line 111
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    return p1

    .line 112
    :cond_8
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 20

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move-object/from16 v8, p2

    .line 125
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    iget v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    const/4 v9, 0x0

    const/4 v10, 0x1

    invoke-virtual {v0, v9, v1, v10}, Ljava/util/BitSet;->set(IIZ)V

    .line 126
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget-boolean v0, v0, Lb/p/d/f;->i:Z

    if-eqz v0, :cond_25

    .line 127
    iget v0, v8, Lb/p/d/f;->e:I

    if-ne v0, v10, :cond_20

    const v0, 0x7fffffff

    const v11, 0x7fffffff

    goto :goto_35

    :cond_20
    const/high16 v0, -0x80000000

    const/high16 v11, -0x80000000

    goto :goto_35

    .line 128
    :cond_25
    iget v0, v8, Lb/p/d/f;->e:I

    if-ne v0, v10, :cond_2f

    .line 129
    iget v0, v8, Lb/p/d/f;->g:I

    iget v1, v8, Lb/p/d/f;->b:I

    add-int/2addr v0, v1

    goto :goto_34

    .line 130
    :cond_2f
    iget v0, v8, Lb/p/d/f;->f:I

    iget v1, v8, Lb/p/d/f;->b:I

    sub-int/2addr v0, v1

    :goto_34
    move v11, v0

    .line 131
    :goto_35
    iget v0, v8, Lb/p/d/f;->e:I

    invoke-virtual {v6, v0, v11}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->e(II)V

    .line 132
    iget-boolean v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v0, :cond_45

    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 133
    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    goto :goto_4b

    :cond_45
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 134
    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    :goto_4b
    move v12, v0

    const/4 v0, 0x0

    .line 135
    :goto_4d
    invoke-virtual/range {p2 .. p3}, Lb/p/d/f;->a(Landroidx/recyclerview/widget/RecyclerView$y;)Z

    move-result v1

    const/4 v2, -0x1

    if-eqz v1, :cond_1ce

    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget-boolean v1, v1, Lb/p/d/f;->i:Z

    if-nez v1, :cond_62

    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    .line 136
    invoke-virtual {v1}, Ljava/util/BitSet;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1ce

    .line 137
    :cond_62
    invoke-virtual {v8, v7}, Lb/p/d/f;->a(Landroidx/recyclerview/widget/RecyclerView$u;)Landroid/view/View;

    move-result-object v13

    .line 138
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 139
    invoke-virtual {v14}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->a()I

    move-result v0

    .line 140
    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->d(I)I

    move-result v1

    if-ne v1, v2, :cond_7b

    const/4 v3, 0x1

    goto :goto_7c

    :cond_7b
    const/4 v3, 0x0

    :goto_7c
    if-eqz v3, :cond_91

    .line 141
    iget-boolean v1, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v1, :cond_87

    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v9

    goto :goto_8b

    :cond_87
    invoke-virtual {v6, v8}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Lb/p/d/f;)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    move-result-object v1

    .line 142
    :goto_8b
    iget-object v4, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v4, v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(ILandroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V

    goto :goto_95

    .line 143
    :cond_91
    iget-object v4, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v4, v1

    :goto_95
    move-object v15, v1

    .line 144
    iput-object v15, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 145
    iget v1, v8, Lb/p/d/f;->e:I

    if-ne v1, v10, :cond_a0

    .line 146
    invoke-virtual {v6, v13}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroid/view/View;)V

    goto :goto_a3

    .line 147
    :cond_a0
    invoke-virtual {v6, v13, v9}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroid/view/View;I)V

    .line 148
    :goto_a3
    invoke-virtual {v6, v13, v14, v9}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroid/view/View;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;Z)V

    .line 149
    iget v1, v8, Lb/p/d/f;->e:I

    if-ne v1, v10, :cond_d4

    .line 150
    iget-boolean v1, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v1, :cond_b3

    invoke-virtual {v6, v12}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p(I)I

    move-result v1

    goto :goto_b7

    .line 151
    :cond_b3
    invoke-virtual {v15, v12}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v1

    .line 152
    :goto_b7
    iget-object v4, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v4, v13}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v4

    add-int/2addr v4, v1

    if-eqz v3, :cond_d1

    .line 153
    iget-boolean v5, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v5, :cond_d1

    .line 154
    invoke-virtual {v6, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->l(I)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v5

    .line 155
    iput v2, v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->i:I

    .line 156
    iput v0, v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->h:I

    .line 157
    iget-object v9, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v9, v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    :cond_d1
    move v5, v4

    move v4, v1

    goto :goto_fd

    .line 158
    :cond_d4
    iget-boolean v1, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v1, :cond_dd

    invoke-virtual {v6, v12}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s(I)I

    move-result v1

    goto :goto_e1

    .line 159
    :cond_dd
    invoke-virtual {v15, v12}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v1

    .line 160
    :goto_e1
    iget-object v4, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v4, v13}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v4

    sub-int v4, v1, v4

    if-eqz v3, :cond_fc

    .line 161
    iget-boolean v5, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v5, :cond_fc

    .line 162
    invoke-virtual {v6, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->m(I)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v5

    .line 163
    iput v10, v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->i:I

    .line 164
    iput v0, v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->h:I

    .line 165
    iget-object v9, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v9, v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;)V

    :cond_fc
    move v5, v1

    .line 166
    :goto_fd
    iget-boolean v1, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v1, :cond_126

    iget v1, v8, Lb/p/d/f;->d:I

    if-ne v1, v2, :cond_126

    if-eqz v3, :cond_10a

    .line 167
    iput-boolean v10, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    goto :goto_126

    .line 168
    :cond_10a
    iget v1, v8, Lb/p/d/f;->e:I

    if-ne v1, v10, :cond_113

    .line 169
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E()Z

    move-result v1

    goto :goto_117

    .line 170
    :cond_113
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F()Z

    move-result v1

    :goto_117
    xor-int/2addr v1, v10

    if-eqz v1, :cond_126

    .line 171
    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    .line 172
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->c(I)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    move-result-object v0

    if-eqz v0, :cond_124

    .line 173
    iput-boolean v10, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->k:Z

    .line 174
    :cond_124
    iput-boolean v10, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    .line 175
    :cond_126
    :goto_126
    invoke-virtual {v6, v13, v14, v8}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroid/view/View;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;Lb/p/d/f;)V

    .line 176
    invoke-virtual/range {p0 .. p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result v0

    if-eqz v0, :cond_15a

    iget v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne v0, v10, :cond_15a

    .line 177
    iget-boolean v0, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v0, :cond_13e

    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    goto :goto_14f

    :cond_13e
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    .line 178
    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    iget v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    sub-int/2addr v1, v10

    iget v2, v15, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    sub-int/2addr v1, v2

    iget v2, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    mul-int v1, v1, v2

    sub-int/2addr v0, v1

    .line 179
    :goto_14f
    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v1, v13}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v1

    sub-int v1, v0, v1

    move v9, v0

    move v3, v1

    goto :goto_17b

    .line 180
    :cond_15a
    iget-boolean v0, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v0, :cond_165

    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    goto :goto_172

    :cond_165
    iget v0, v15, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    iget v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    mul-int v0, v0, v1

    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    .line 181
    invoke-virtual {v1}, Lb/p/d/i;->f()I

    move-result v1

    add-int/2addr v0, v1

    .line 182
    :goto_172
    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v1, v13}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v1

    add-int/2addr v1, v0

    move v3, v0

    move v9, v1

    .line 183
    :goto_17b
    iget v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne v0, v10, :cond_189

    move-object/from16 v0, p0

    move-object v1, v13

    move v2, v3

    move v3, v4

    move v4, v9

    .line 184
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;IIII)V

    goto :goto_192

    :cond_189
    move-object/from16 v0, p0

    move-object v1, v13

    move v2, v4

    move v4, v5

    move v5, v9

    .line 185
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;IIII)V

    .line 186
    :goto_192
    iget-boolean v0, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v0, :cond_19e

    .line 187
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v0, v0, Lb/p/d/f;->e:I

    invoke-virtual {v6, v0, v11}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->e(II)V

    goto :goto_1a5

    .line 188
    :cond_19e
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v0, v0, Lb/p/d/f;->e:I

    invoke-virtual {v6, v15, v0, v11}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;II)V

    .line 189
    :goto_1a5
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    invoke-virtual {v6, v7, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;)V

    .line 190
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget-boolean v0, v0, Lb/p/d/f;->h:Z

    if-eqz v0, :cond_1c9

    invoke-virtual {v13}, Landroid/view/View;->hasFocusable()Z

    move-result v0

    if-eqz v0, :cond_1c9

    .line 191
    iget-boolean v0, v14, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v0, :cond_1c0

    .line 192
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    invoke-virtual {v0}, Ljava/util/BitSet;->clear()V

    goto :goto_1c9

    .line 193
    :cond_1c0
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    iget v1, v15, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Ljava/util/BitSet;->set(IZ)V

    goto :goto_1ca

    :cond_1c9
    :goto_1c9
    const/4 v3, 0x0

    :goto_1ca
    const/4 v0, 0x1

    const/4 v9, 0x0

    goto/16 :goto_4d

    :cond_1ce
    const/4 v3, 0x0

    if-nez v0, :cond_1d6

    .line 194
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    invoke-virtual {v6, v7, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;)V

    .line 195
    :cond_1d6
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v0, v0, Lb/p/d/f;->e:I

    if-ne v0, v2, :cond_1ee

    .line 196
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    invoke-virtual {v6, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s(I)I

    move-result v0

    .line 197
    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->f()I

    move-result v1

    sub-int/2addr v1, v0

    goto :goto_200

    .line 198
    :cond_1ee
    iget-object v0, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    invoke-virtual {v6, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p(I)I

    move-result v0

    .line 199
    iget-object v1, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    sub-int v1, v0, v1

    :goto_200
    if-lez v1, :cond_209

    .line 200
    iget v0, v8, Lb/p/d/f;->b:I

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v9

    goto :goto_20a

    :cond_209
    const/4 v9, 0x0

    :goto_20a
    return v9
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 51
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->h(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public a(I)Landroid/graphics/PointF;
    .registers 5

    .line 252
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->j(I)I

    move-result p1

    .line 253
    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    if-nez p1, :cond_d

    const/4 p1, 0x0

    return-object p1

    .line 254
    :cond_d
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v2, 0x0

    if-nez v1, :cond_18

    int-to-float p1, p1

    .line 255
    iput p1, v0, Landroid/graphics/PointF;->x:F

    .line 256
    iput v2, v0, Landroid/graphics/PointF;->y:F

    goto :goto_1d

    .line 257
    :cond_18
    iput v2, v0, Landroid/graphics/PointF;->x:F

    int-to-float p1, p1

    .line 258
    iput p1, v0, Landroid/graphics/PointF;->y:F

    :goto_1d
    return-object v0
.end method

.method public a(Landroid/view/View;ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;
    .registers 13

    .line 288
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return-object v1

    .line 289
    :cond_8
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->c(Landroid/view/View;)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_f

    return-object v1

    .line 290
    :cond_f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P()V

    .line 291
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->k(I)I

    move-result p2

    const/high16 v0, -0x80000000

    if-ne p2, v0, :cond_1b

    return-object v1

    .line 292
    :cond_1b
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 293
    iget-boolean v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    .line 294
    iget-object v0, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v3, 0x1

    if-ne p2, v3, :cond_2d

    .line 295
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v4

    goto :goto_31

    .line 296
    :cond_2d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v4

    .line 297
    :goto_31
    invoke-virtual {p0, v4, p4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(ILandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 298
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u(I)V

    .line 299
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v6, v5, Lb/p/d/f;->d:I

    add-int/2addr v6, v4

    iput v6, v5, Lb/p/d/f;->c:I

    const v6, 0x3eaaaaab

    .line 300
    iget-object v7, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v7}, Lb/p/d/i;->g()I

    move-result v7

    int-to-float v7, v7

    mul-float v7, v7, v6

    float-to-int v6, v7

    iput v6, v5, Lb/p/d/f;->b:I

    .line 301
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iput-boolean v3, v5, Lb/p/d/f;->h:Z

    const/4 v6, 0x0

    .line 302
    iput-boolean v6, v5, Lb/p/d/f;->a:Z

    .line 303
    invoke-virtual {p0, p3, v5, p4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I

    .line 304
    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    iput-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    if-nez v2, :cond_66

    .line 305
    invoke-virtual {v0, v4, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(II)Landroid/view/View;

    move-result-object p3

    if-eqz p3, :cond_66

    if-eq p3, p1, :cond_66

    return-object p3

    .line 306
    :cond_66
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t(I)Z

    move-result p3

    if-eqz p3, :cond_81

    .line 307
    iget p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    sub-int/2addr p3, v3

    :goto_6f
    if-ltz p3, :cond_96

    .line 308
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object p4, p4, p3

    invoke-virtual {p4, v4, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(II)Landroid/view/View;

    move-result-object p4

    if-eqz p4, :cond_7e

    if-eq p4, p1, :cond_7e

    return-object p4

    :cond_7e
    add-int/lit8 p3, p3, -0x1

    goto :goto_6f

    :cond_81
    const/4 p3, 0x0

    .line 309
    :goto_82
    iget p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge p3, p4, :cond_96

    .line 310
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object p4, p4, p3

    invoke-virtual {p4, v4, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(II)Landroid/view/View;

    move-result-object p4

    if-eqz p4, :cond_93

    if-eq p4, p1, :cond_93

    return-object p4

    :cond_93
    add-int/lit8 p3, p3, 0x1

    goto :goto_82

    .line 311
    :cond_96
    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:Z

    xor-int/2addr p3, v3

    const/4 p4, -0x1

    if-ne p2, p4, :cond_9e

    const/4 p4, 0x1

    goto :goto_9f

    :cond_9e
    const/4 p4, 0x0

    :goto_9f
    if-ne p3, p4, :cond_a3

    const/4 p3, 0x1

    goto :goto_a4

    :cond_a3
    const/4 p3, 0x0

    :goto_a4
    if-nez v2, :cond_ba

    if-eqz p3, :cond_ad

    .line 312
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->d()I

    move-result p4

    goto :goto_b1

    .line 313
    :cond_ad
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e()I

    move-result p4

    .line 314
    :goto_b1
    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->c(I)Landroid/view/View;

    move-result-object p4

    if-eqz p4, :cond_ba

    if-eq p4, p1, :cond_ba

    return-object p4

    .line 315
    :cond_ba
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t(I)Z

    move-result p2

    if-eqz p2, :cond_e9

    .line 316
    iget p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    sub-int/2addr p2, v3

    :goto_c3
    if-ltz p2, :cond_10c

    .line 317
    iget p4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    if-ne p2, p4, :cond_ca

    goto :goto_e6

    :cond_ca
    if-eqz p3, :cond_d5

    .line 318
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object p4, p4, p2

    .line 319
    invoke-virtual {p4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->d()I

    move-result p4

    goto :goto_dd

    :cond_d5
    iget-object p4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object p4, p4, p2

    .line 320
    invoke-virtual {p4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e()I

    move-result p4

    .line 321
    :goto_dd
    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->c(I)Landroid/view/View;

    move-result-object p4

    if-eqz p4, :cond_e6

    if-eq p4, p1, :cond_e6

    return-object p4

    :cond_e6
    :goto_e6
    add-int/lit8 p2, p2, -0x1

    goto :goto_c3

    .line 322
    :cond_e9
    :goto_e9
    iget p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v6, p2, :cond_10c

    if-eqz p3, :cond_f8

    .line 323
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object p2, p2, v6

    .line 324
    invoke-virtual {p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->d()I

    move-result p2

    goto :goto_100

    :cond_f8
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object p2, p2, v6

    .line 325
    invoke-virtual {p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e()I

    move-result p2

    .line 326
    :goto_100
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->c(I)Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_109

    if-eq p2, p1, :cond_109

    return-object p2

    :cond_109
    add-int/lit8 v6, v6, 0x1

    goto :goto_e9

    :cond_10c
    return-object v1
.end method

.method public a(Z)Landroid/view/View;
    .registers 9

    .line 113
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    .line 114
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    .line 115
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x0

    :goto_13
    if-ltz v2, :cond_37

    .line 116
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v4

    .line 117
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v5, v4}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v5

    .line 118
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v6, v4}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v6

    if-le v6, v0, :cond_34

    if-lt v5, v1, :cond_2a

    goto :goto_34

    :cond_2a
    if-le v6, v1, :cond_33

    if-nez p1, :cond_2f

    goto :goto_33

    :cond_2f
    if-nez v3, :cond_34

    move-object v3, v4

    goto :goto_34

    :cond_33
    :goto_33
    return-object v4

    :cond_34
    :goto_34
    add-int/lit8 v2, v2, -0x1

    goto :goto_13

    :cond_37
    return-object v3
.end method

.method public a(Landroid/content/Context;Landroid/util/AttributeSet;)Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .registers 4

    .line 283
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-object v0
.end method

.method public a(Landroid/view/ViewGroup$LayoutParams;)Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .registers 3

    .line 284
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_c

    .line 285
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$MarginLayoutParams;)V

    return-object v0

    .line 286
    :cond_c
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(Landroid/view/ViewGroup$LayoutParams;)V

    return-object v0
.end method

.method public final a(Lb/p/d/f;)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;
    .registers 9

    .line 240
    iget v0, p1, Lb/p/d/f;->e:I

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t(I)Z

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-eqz v0, :cond_f

    .line 241
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    sub-int/2addr v0, v2

    const/4 v3, -0x1

    goto :goto_13

    :cond_f
    const/4 v0, 0x0

    .line 242
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    const/4 v3, 0x1

    .line 243
    :goto_13
    iget p1, p1, Lb/p/d/f;->e:I

    const/4 v4, 0x0

    if-ne p1, v2, :cond_32

    const p1, 0x7fffffff

    .line 244
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->f()I

    move-result v2

    :goto_21
    if-eq v0, v1, :cond_31

    .line 245
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v0

    .line 246
    invoke-virtual {v5, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v6

    if-ge v6, p1, :cond_2f

    move-object v4, v5

    move p1, v6

    :cond_2f
    add-int/2addr v0, v3

    goto :goto_21

    :cond_31
    return-object v4

    :cond_32
    const/high16 p1, -0x80000000

    .line 247
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->b()I

    move-result v2

    :goto_3a
    if-eq v0, v1, :cond_4a

    .line 248
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v0

    .line 249
    invoke-virtual {v5, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v6

    if-le v6, p1, :cond_48

    move-object v4, v5

    move p1, v6

    :cond_48
    add-int/2addr v0, v3

    goto :goto_3a

    :cond_4a
    return-object v4
.end method

.method public a(IILandroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$o$c;)V
    .registers 9

    .line 262
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-nez v0, :cond_5

    goto :goto_6

    :cond_5
    move p1, p2

    .line 263
    :goto_6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result p2

    if-eqz p2, :cond_7a

    if-nez p1, :cond_f

    goto :goto_7a

    .line 264
    :cond_f
    invoke-virtual {p0, p1, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(ILandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 265
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O:[I

    if-eqz p1, :cond_1b

    array-length p1, p1

    iget p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge p1, p2, :cond_21

    .line 266
    :cond_1b
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    new-array p1, p1, [I

    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O:[I

    :cond_21
    const/4 p1, 0x0

    const/4 p2, 0x0

    const/4 v0, 0x0

    .line 267
    :goto_24
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge p2, v1, :cond_54

    .line 268
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v2, v1, Lb/p/d/f;->d:I

    const/4 v3, -0x1

    if-ne v2, v3, :cond_3a

    iget v1, v1, Lb/p/d/f;->f:I

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, p2

    .line 269
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v2

    goto :goto_48

    :cond_3a
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, p2

    iget v1, v1, Lb/p/d/f;->g:I

    .line 270
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v1

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v2, v2, Lb/p/d/f;->g:I

    :goto_48
    sub-int/2addr v1, v2

    if-ltz v1, :cond_51

    .line 271
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O:[I

    aput v1, v2, v0

    add-int/lit8 v0, v0, 0x1

    :cond_51
    add-int/lit8 p2, p2, 0x1

    goto :goto_24

    .line 272
    :cond_54
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O:[I

    invoke-static {p2, p1, v0}, Ljava/util/Arrays;->sort([III)V

    :goto_59
    if-ge p1, v0, :cond_7a

    .line 273
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    invoke-virtual {p2, p3}, Lb/p/d/f;->a(Landroidx/recyclerview/widget/RecyclerView$y;)Z

    move-result p2

    if-eqz p2, :cond_7a

    .line 274
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget p2, p2, Lb/p/d/f;->c:I

    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O:[I

    aget v1, v1, p1

    invoke-interface {p4, p2, v1}, Landroidx/recyclerview/widget/RecyclerView$o$c;->a(II)V

    .line 275
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v1, p2, Lb/p/d/f;->c:I

    iget v2, p2, Lb/p/d/f;->d:I

    add-int/2addr v1, v2

    iput v1, p2, Lb/p/d/f;->c:I

    add-int/lit8 p1, p1, 0x1

    goto :goto_59

    :cond_7a
    :goto_7a
    return-void
.end method

.method public a(ILandroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 7

    const/4 v0, 0x1

    if-lez p1, :cond_9

    .line 276
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v1

    const/4 v2, 0x1

    goto :goto_10

    :cond_9
    const/4 v1, -0x1

    .line 277
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v2

    move v1, v2

    const/4 v2, -0x1

    .line 278
    :goto_10
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iput-boolean v0, v3, Lb/p/d/f;->a:Z

    .line 279
    invoke-virtual {p0, v1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(ILandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 280
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u(I)V

    .line 281
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v0, p2, Lb/p/d/f;->d:I

    add-int/2addr v1, v0

    iput v1, p2, Lb/p/d/f;->c:I

    .line 282
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iput p1, p2, Lb/p/d/f;->b:I

    return-void
.end method

.method public a(Landroid/graphics/Rect;II)V
    .registers 8

    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->o()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->p()I

    move-result v1

    add-int/2addr v0, v1

    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v1

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v2

    add-int/2addr v1, v2

    .line 14
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_34

    .line 15
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    add-int/2addr p1, v1

    .line 16
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->l()I

    move-result v1

    invoke-static {p3, p1, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(III)I

    move-result p1

    .line 17
    iget p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    mul-int p3, p3, v1

    add-int/2addr p3, v0

    .line 18
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->m()I

    move-result v0

    .line 19
    invoke-static {p2, p3, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->a(III)I

    move-result p2

    goto :goto_50

    .line 20
    :cond_34
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    add-int/2addr p1, v0

    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->m()I

    move-result v0

    invoke-static {p2, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->a(III)I

    move-result p2

    .line 22
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    mul-int p1, p1, v0

    add-int/2addr p1, v1

    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->l()I

    move-result v0

    .line 24
    invoke-static {p3, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->a(III)I

    move-result p1

    .line 25
    :goto_50
    invoke-virtual {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->c(II)V

    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 3

    .line 88
    instance-of v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 89
    check-cast p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    .line 90
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    :cond_b
    return-void
.end method

.method public final a(Landroid/view/View;IIZ)V
    .registers 9

    .line 81
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K:Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 83
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->left:I

    add-int/2addr v1, v3

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iget v2, v2, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v2

    invoke-virtual {p0, p2, v1, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->d(III)I

    move-result p2

    .line 84
    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K:Landroid/graphics/Rect;

    iget v3, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v3

    iget v3, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v3, v2

    invoke-virtual {p0, p3, v1, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->d(III)I

    move-result p3

    if-eqz p4, :cond_32

    .line 85
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroid/view/View;IILandroidx/recyclerview/widget/RecyclerView$LayoutParams;)Z

    move-result p4

    goto :goto_36

    .line 86
    :cond_32
    invoke-virtual {p0, p1, p2, p3, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;IILandroidx/recyclerview/widget/RecyclerView$LayoutParams;)Z

    move-result p4

    :goto_36
    if-eqz p4, :cond_3b

    .line 87
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    :cond_3b
    return-void
.end method

.method public final a(Landroid/view/View;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;Lb/p/d/f;)V
    .registers 5

    .line 201
    iget p3, p3, Lb/p/d/f;->e:I

    const/4 v0, 0x1

    if-ne p3, v0, :cond_13

    .line 202
    iget-boolean p3, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz p3, :cond_d

    .line 203
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p(Landroid/view/View;)V

    goto :goto_20

    .line 204
    :cond_d
    iget-object p2, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(Landroid/view/View;)V

    goto :goto_20

    .line 205
    :cond_13
    iget-boolean p3, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz p3, :cond_1b

    .line 206
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q(Landroid/view/View;)V

    goto :goto_20

    .line 207
    :cond_1b
    iget-object p2, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c(Landroid/view/View;)V

    :goto_20
    return-void
.end method

.method public final a(Landroid/view/View;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;Z)V
    .registers 10

    .line 52
    iget-boolean v0, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_43

    .line 53
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne v0, v1, :cond_26

    .line 54
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J:I

    .line 55
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->h()I

    move-result v2

    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->i()I

    move-result v3

    .line 57
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v4

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v5

    add-int/2addr v4, v5

    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 58
    invoke-static {v2, v3, v4, p2, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(IIIIZ)I

    move-result p2

    .line 59
    invoke-virtual {p0, p1, v0, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroid/view/View;IIZ)V

    goto :goto_95

    .line 60
    :cond_26
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->r()I

    move-result v0

    .line 61
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->s()I

    move-result v2

    .line 62
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->o()I

    move-result v3

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->p()I

    move-result v4

    add-int/2addr v3, v4

    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 63
    invoke-static {v0, v2, v3, p2, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(IIIIZ)I

    move-result p2

    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J:I

    .line 64
    invoke-virtual {p0, p1, p2, v0, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroid/view/View;IIZ)V

    goto :goto_95

    .line 65
    :cond_43
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_6f

    .line 66
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    .line 67
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->s()I

    move-result v3

    iget v4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 68
    invoke-static {v0, v3, v2, v4, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(IIIIZ)I

    move-result v0

    .line 69
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->h()I

    move-result v2

    .line 70
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->i()I

    move-result v3

    .line 71
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v4

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v5

    add-int/2addr v4, v5

    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 72
    invoke-static {v2, v3, v4, p2, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(IIIIZ)I

    move-result p2

    .line 73
    invoke-virtual {p0, p1, v0, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroid/view/View;IIZ)V

    goto :goto_95

    .line 74
    :cond_6f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->r()I

    move-result v0

    .line 75
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->s()I

    move-result v3

    .line 76
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->o()I

    move-result v4

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->p()I

    move-result v5

    add-int/2addr v4, v5

    iget v5, p2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 77
    invoke-static {v0, v3, v4, v5, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(IIIIZ)I

    move-result v0

    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    .line 78
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->i()I

    move-result v3

    iget p2, p2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 79
    invoke-static {v1, v3, v2, p2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(IIIIZ)I

    move-result p2

    .line 80
    invoke-virtual {p0, p1, v0, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroid/view/View;IIZ)V

    :goto_95
    return-void
.end method

.method public a(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 4

    .line 100
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 101
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-lez v0, :cond_2f

    const/4 v0, 0x0

    .line 102
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Z)Landroid/view/View;

    move-result-object v1

    .line 103
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Z)Landroid/view/View;

    move-result-object v0

    if-eqz v1, :cond_2f

    if-nez v0, :cond_17

    goto :goto_2f

    .line 104
    :cond_17
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    .line 105
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    if-ge v1, v0, :cond_28

    .line 106
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 107
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    goto :goto_2f

    .line 108
    :cond_28
    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 109
    invoke-virtual {p1, v1}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    nop

    :cond_2f
    :goto_2f
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;I)V
    .registers 9

    .line 227
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_6
    if-ltz v0, :cond_60

    .line 228
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v2

    .line 229
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3, v2}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v3

    if-lt v3, p2, :cond_60

    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 230
    invoke-virtual {v3, v2}, Lb/p/d/i;->f(Landroid/view/View;)I

    move-result v3

    if-lt v3, p2, :cond_60

    .line 231
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 232
    iget-boolean v4, v3, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz v4, :cond_4a

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 233
    :goto_28
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v4, v5, :cond_3c

    .line 234
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v4

    iget-object v5, v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ne v5, v1, :cond_39

    return-void

    :cond_39
    add-int/lit8 v4, v4, 0x1

    goto :goto_28

    .line 235
    :cond_3c
    :goto_3c
    iget v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v3, v4, :cond_5a

    .line 236
    iget-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v4, v4, v3

    invoke-virtual {v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->j()V

    add-int/lit8 v3, v3, 0x1

    goto :goto_3c

    .line 237
    :cond_4a
    iget-object v4, v3, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget-object v4, v4, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ne v4, v1, :cond_55

    return-void

    .line 238
    :cond_55
    iget-object v3, v3, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-virtual {v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->j()V

    .line 239
    :cond_5a
    invoke-virtual {p0, v2, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$u;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_60
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 11

    .line 91
    invoke-virtual {p3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    .line 92
    instance-of p2, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    if-nez p2, :cond_c

    .line 93
    invoke-super {p0, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    return-void

    .line 94
    :cond_c
    check-cast p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 95
    iget p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 p3, 0x1

    if-nez p2, :cond_2c

    .line 96
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e()I

    move-result v0

    iget-boolean p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz p1, :cond_1f

    iget p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    move v1, p3

    goto :goto_20

    :cond_1f
    const/4 v1, 0x1

    :goto_20
    const/4 v2, -0x1

    const/4 v3, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 97
    invoke-static/range {v0 .. v5}, Lb/h/m/h0/c$c;->a(IIIIZZ)Lb/h/m/h0/c$c;

    move-result-object p1

    invoke-virtual {p4, p1}, Lb/h/m/h0/c;->b(Ljava/lang/Object;)V

    goto :goto_44

    :cond_2c
    const/4 v0, -0x1

    const/4 v1, -0x1

    .line 98
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e()I

    move-result v2

    iget-boolean p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    if-eqz p1, :cond_3a

    iget p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    move v3, p3

    goto :goto_3b

    :cond_3a
    const/4 v3, 0x1

    :goto_3b
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 99
    invoke-static/range {v0 .. v5}, Lb/h/m/h0/c$c;->a(IIIIZZ)Lb/h/m/h0/c$c;

    move-result-object p1

    invoke-virtual {p4, p1}, Lb/h/m/h0/c;->b(Ljava/lang/Object;)V

    :goto_44
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V
    .registers 6

    const/high16 v0, -0x80000000

    .line 119
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->p(I)I

    move-result v1

    if-ne v1, v0, :cond_9

    return-void

    .line 120
    :cond_9
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    sub-int/2addr v0, v1

    if-lez v0, :cond_22

    neg-int v1, v0

    .line 121
    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    neg-int p1, p1

    sub-int/2addr v0, p1

    if-eqz p3, :cond_22

    if-lez v0, :cond_22

    .line 122
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1, v0}, Lb/p/d/i;->a(I)V

    :cond_22
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;)V
    .registers 5

    .line 208
    iget-boolean v0, p2, Lb/p/d/f;->a:Z

    if-eqz v0, :cond_56

    iget-boolean v0, p2, Lb/p/d/f;->i:Z

    if-eqz v0, :cond_9

    goto :goto_56

    .line 209
    :cond_9
    iget v0, p2, Lb/p/d/f;->b:I

    const/4 v1, -0x1

    if-nez v0, :cond_1e

    .line 210
    iget v0, p2, Lb/p/d/f;->e:I

    if-ne v0, v1, :cond_18

    .line 211
    iget p2, p2, Lb/p/d/f;->g:I

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;I)V

    goto :goto_56

    .line 212
    :cond_18
    iget p2, p2, Lb/p/d/f;->f:I

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;I)V

    goto :goto_56

    .line 213
    :cond_1e
    iget v0, p2, Lb/p/d/f;->e:I

    if-ne v0, v1, :cond_3c

    .line 214
    iget v0, p2, Lb/p/d/f;->f:I

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->q(I)I

    move-result v1

    sub-int/2addr v0, v1

    if-gez v0, :cond_2e

    .line 215
    iget p2, p2, Lb/p/d/f;->g:I

    goto :goto_38

    .line 216
    :cond_2e
    iget v1, p2, Lb/p/d/f;->g:I

    iget p2, p2, Lb/p/d/f;->b:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    sub-int p2, v1, p2

    .line 217
    :goto_38
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;I)V

    goto :goto_56

    .line 218
    :cond_3c
    iget v0, p2, Lb/p/d/f;->g:I

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->r(I)I

    move-result v0

    iget v1, p2, Lb/p/d/f;->g:I

    sub-int/2addr v0, v1

    if-gez v0, :cond_4a

    .line 219
    iget p2, p2, Lb/p/d/f;->f:I

    goto :goto_53

    .line 220
    :cond_4a
    iget v1, p2, Lb/p/d/f;->f:I

    iget p2, p2, Lb/p/d/f;->b:I

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    add-int/2addr p2, v1

    .line 221
    :goto_53
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;I)V

    :cond_56
    :goto_56
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;III)V
    .registers 5

    const/16 p1, 0x8

    .line 123
    invoke-virtual {p0, p2, p3, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(III)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;IILjava/lang/Object;)V
    .registers 5

    const/4 p1, 0x4

    .line 124
    invoke-virtual {p0, p2, p3, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(III)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$y;I)V
    .registers 4

    .line 259
    new-instance p2, Lb/p/d/g;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lb/p/d/g;-><init>(Landroid/content/Context;)V

    .line 260
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$x;->c(I)V

    .line 261
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$x;)V

    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)V
    .registers 6

    .line 26
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->j:I

    if-lez v1, :cond_45

    .line 27
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ne v1, v2, :cond_3c

    const/4 v0, 0x0

    .line 28
    :goto_b
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v0, v1, :cond_45

    .line 29
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c()V

    .line 30
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v2, v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->k:[I

    aget v2, v2, v0

    const/high16 v3, -0x80000000

    if-eq v2, v3, :cond_32

    .line 31
    iget-boolean v1, v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->p:Z

    if-eqz v1, :cond_2b

    .line 32
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    goto :goto_31

    .line 33
    :cond_2b
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->f()I

    move-result v1

    :goto_31
    add-int/2addr v2, v1

    .line 34
    :cond_32
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->d(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 35
    :cond_3c
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->f()V

    .line 36
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->i:I

    iput v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->h:I

    .line 37
    :cond_45
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->q:Z

    iput-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    .line 38
    iget-boolean v0, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->o:Z

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(Z)V

    .line 39
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P()V

    .line 40
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->h:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_61

    .line 41
    iput v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    .line 42
    iget-boolean v0, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->p:Z

    iput-boolean v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    goto :goto_65

    .line 43
    :cond_61
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    iput-boolean v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    .line 44
    :goto_65
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->l:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_76

    .line 45
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    iget-object v1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->m:[I

    iput-object v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a:[I

    .line 46
    iget-object p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->n:Ljava/util/List;

    iput-object p1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b:Ljava/util/List;

    :cond_76
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;II)V
    .registers 7

    .line 222
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->f()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne p2, v2, :cond_17

    .line 223
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->h()I

    move-result p2

    add-int/2addr p2, v0

    if-gt p2, p3, :cond_25

    .line 224
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    iget p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    invoke-virtual {p2, p1, v1}, Ljava/util/BitSet;->set(IZ)V

    goto :goto_25

    .line 225
    :cond_17
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->g()I

    move-result p2

    sub-int/2addr p2, v0

    if-lt p2, p3, :cond_25

    .line 226
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    iget p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->e:I

    invoke-virtual {p2, p1, v1}, Ljava/util/BitSet;->set(IZ)V

    :cond_25
    :goto_25
    return-void
.end method

.method public a(Ljava/lang/String;)V
    .registers 3

    .line 10
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v0, :cond_7

    .line 11
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Ljava/lang/String;)V

    :cond_7
    return-void
.end method

.method public a()Z
    .registers 2

    .line 250
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$LayoutParams;)Z
    .registers 2

    .line 287
    instance-of p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    return p1
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)Z
    .registers 4

    .line 47
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    if-eqz v0, :cond_d

    .line 48
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->o(I)I

    move-result p1

    goto :goto_15

    .line 49
    :cond_d
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->n(I)I

    move-result p1

    :goto_15
    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    const/high16 p1, -0x80000000

    .line 50
    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    const/4 p1, 0x1

    return p1
.end method

.method public final a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)Z
    .registers 5

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_28

    .line 2
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->g()I

    move-result v0

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->b()I

    move-result v2

    if-ge v0, v2, :cond_45

    .line 3
    iget-object v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 4
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(Landroid/view/View;)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object p1

    .line 5
    iget-boolean p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    xor-int/lit8 p1, p1, 0x1

    return p1

    .line 6
    :cond_28
    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->h()I

    move-result v0

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->f()I

    move-result v2

    if-le v0, v2, :cond_45

    .line 7
    iget-object v0, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 8
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(Landroid/view/View;)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    move-result-object p1

    .line 9
    iget-boolean p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    xor-int/lit8 p1, p1, 0x1

    return p1

    :cond_45
    return v1
.end method

.method public b(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 4

    .line 86
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 4

    .line 42
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-nez v0, :cond_7

    .line 43
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    return p1

    .line 44
    :cond_7
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 41
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->i(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public b(Z)Landroid/view/View;
    .registers 10

    .line 45
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    .line 46
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    .line 47
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_12
    if-ge v4, v2, :cond_36

    .line 48
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v5

    .line 49
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v6, v5}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v6

    .line 50
    iget-object v7, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v7, v5}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v7

    if-le v7, v0, :cond_33

    if-lt v6, v1, :cond_29

    goto :goto_33

    :cond_29
    if-ge v6, v0, :cond_32

    if-nez p1, :cond_2e

    goto :goto_32

    :cond_2e
    if-nez v3, :cond_33

    move-object v3, v5

    goto :goto_33

    :cond_32
    :goto_32
    return-object v5

    :cond_33
    :goto_33
    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_36
    return-object v3
.end method

.method public final b(ILandroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 7

    .line 55
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    const/4 v1, 0x0

    iput v1, v0, Lb/p/d/f;->b:I

    .line 56
    iput p1, v0, Lb/p/d/f;->c:I

    .line 57
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->x()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_2e

    .line 58
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->b()I

    move-result p2

    const/4 v0, -0x1

    if-eq p2, v0, :cond_2e

    .line 59
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-ge p2, p1, :cond_1b

    const/4 p1, 0x1

    goto :goto_1c

    :cond_1b
    const/4 p1, 0x0

    :goto_1c
    if-ne v0, p1, :cond_25

    .line 60
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->g()I

    move-result p1

    goto :goto_2f

    .line 61
    :cond_25
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->g()I

    move-result p1

    move p2, p1

    const/4 p1, 0x0

    goto :goto_30

    :cond_2e
    const/4 p1, 0x0

    :goto_2f
    const/4 p2, 0x0

    .line 62
    :goto_30
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->f()Z

    move-result v0

    if-eqz v0, :cond_4d

    .line 63
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3}, Lb/p/d/i;->f()I

    move-result v3

    sub-int/2addr v3, p2

    iput v3, v0, Lb/p/d/f;->f:I

    .line 64
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    add-int/2addr v0, p1

    iput v0, p2, Lb/p/d/f;->g:I

    goto :goto_5d

    .line 65
    :cond_4d
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3}, Lb/p/d/i;->a()I

    move-result v3

    add-int/2addr v3, p1

    iput v3, v0, Lb/p/d/f;->g:I

    .line 66
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    neg-int p2, p2

    iput p2, p1, Lb/p/d/f;->f:I

    .line 67
    :goto_5d
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iput-boolean v1, p1, Lb/p/d/f;->h:Z

    .line 68
    iput-boolean v2, p1, Lb/p/d/f;->a:Z

    .line 69
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p2}, Lb/p/d/i;->d()I

    move-result p2

    if-nez p2, :cond_74

    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 70
    invoke-virtual {p2}, Lb/p/d/i;->a()I

    move-result p2

    if-nez p2, :cond_74

    const/4 v1, 0x1

    :cond_74
    iput-boolean v1, p1, Lb/p/d/f;->i:Z

    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$u;I)V
    .registers 8

    .line 72
    :goto_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-lez v0, :cond_5d

    const/4 v0, 0x0

    .line 73
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v1

    .line 74
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, v1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v2

    if-gt v2, p2, :cond_5d

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 75
    invoke-virtual {v2, v1}, Lb/p/d/i;->e(Landroid/view/View;)I

    move-result v2

    if-gt v2, p2, :cond_5d

    .line 76
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    .line 77
    iget-boolean v3, v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->f:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_49

    const/4 v2, 0x0

    .line 78
    :goto_27
    iget v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v2, v3, :cond_3b

    .line 79
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v3, v3, v2

    iget-object v3, v3, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ne v3, v4, :cond_38

    return-void

    :cond_38
    add-int/lit8 v2, v2, 0x1

    goto :goto_27

    .line 80
    :cond_3b
    :goto_3b
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v0, v2, :cond_59

    .line 81
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->k()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_3b

    .line 82
    :cond_49
    iget-object v0, v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iget-object v0, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ne v0, v4, :cond_54

    return-void

    .line 83
    :cond_54
    iget-object v0, v2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;->e:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->k()V

    .line 84
    :cond_59
    invoke-virtual {p0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$u;)V

    goto :goto_0

    :cond_5d
    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V
    .registers 6

    const v0, 0x7fffffff

    .line 51
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s(I)I

    move-result v1

    if-ne v1, v0, :cond_a

    return-void

    .line 52
    :cond_a
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    sub-int/2addr v1, v0

    if-lez v1, :cond_22

    .line 53
    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    sub-int/2addr v1, p1

    if-eqz p3, :cond_22

    if-lez v1, :cond_22

    .line 54
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    neg-int p2, v1

    invoke-virtual {p1, p2}, Lb/p/d/i;->a(I)V

    :cond_22
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 4

    const/4 p1, 0x1

    .line 71
    invoke-virtual {p0, p2, p3, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(III)V

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$u;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$u;)V

    .line 2
    iget-object p2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P:Ljava/lang/Runnable;

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Ljava/lang/Runnable;)Z

    const/4 p2, 0x0

    .line 3
    :goto_9
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge p2, v0, :cond_17

    .line 4
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v0, v0, p2

    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c()V

    add-int/lit8 p2, p2, 0x1

    goto :goto_9

    .line 5
    :cond_17
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public b()Z
    .registers 3

    .line 85
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    return v1
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)Z
    .registers 8

    .line 6
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_de

    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    goto/16 :goto_de

    :cond_e
    const/high16 v3, -0x80000000

    if-ltz v0, :cond_da

    .line 7
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    if-lt v0, p1, :cond_1a

    goto/16 :goto_da

    .line 8
    :cond_1a
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v0, 0x1

    if-eqz p1, :cond_30

    iget v4, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->h:I

    if-eq v4, v2, :cond_30

    iget p1, p1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->j:I

    if-ge p1, v0, :cond_28

    goto :goto_30

    .line 9
    :cond_28
    iput v3, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    .line 10
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    goto/16 :goto_d9

    .line 11
    :cond_30
    :goto_30
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->c(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_bf

    .line 12
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v1, :cond_41

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v1

    goto :goto_45

    .line 13
    :cond_41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v1

    :goto_45
    iput v1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    .line 14
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    if-eq v1, v3, :cond_75

    .line 15
    iget-boolean v1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    if-eqz v1, :cond_62

    .line 16
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    sub-int/2addr v1, v2

    .line 17
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result p1

    sub-int/2addr v1, p1

    iput v1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    goto :goto_74

    .line 18
    :cond_62
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->f()I

    move-result v1

    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    add-int/2addr v1, v2

    .line 19
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result p1

    sub-int/2addr v1, p1

    iput v1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    :goto_74
    return v0

    .line 20
    :cond_75
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1, p1}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v1

    .line 21
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->g()I

    move-result v2

    if-le v1, v2, :cond_97

    .line 22
    iget-boolean p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    if-eqz p1, :cond_8e

    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 23
    invoke-virtual {p1}, Lb/p/d/i;->b()I

    move-result p1

    goto :goto_94

    :cond_8e
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 24
    invoke-virtual {p1}, Lb/p/d/i;->f()I

    move-result p1

    :goto_94
    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    return v0

    .line 25
    :cond_97
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1, p1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v1

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 26
    invoke-virtual {v2}, Lb/p/d/i;->f()I

    move-result v2

    sub-int/2addr v1, v2

    if-gez v1, :cond_aa

    neg-int p1, v1

    .line 27
    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    return v0

    .line 28
    :cond_aa
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 29
    invoke-virtual {v2, p1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result p1

    sub-int/2addr v1, p1

    if-gez v1, :cond_bc

    .line 30
    iput v1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    return v0

    .line 31
    :cond_bc
    iput v3, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    goto :goto_d9

    .line 32
    :cond_bf
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    .line 33
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    if-ne v2, v3, :cond_d4

    .line 34
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->j(I)I

    move-result p1

    if-ne p1, v0, :cond_ce

    const/4 v1, 0x1

    .line 35
    :cond_ce
    iput-boolean v1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    .line 36
    invoke-virtual {p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a()V

    goto :goto_d7

    .line 37
    :cond_d4
    invoke-virtual {p2, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a(I)V

    .line 38
    :goto_d7
    iput-boolean v0, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->d:Z

    :goto_d9
    return v0

    .line 39
    :cond_da
    :goto_da
    iput v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    .line 40
    iput v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    :cond_de
    :goto_de
    return v1
.end method

.method public c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 6

    .line 87
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_31

    if-nez p1, :cond_a

    goto :goto_31

    .line 88
    :cond_a
    invoke-virtual {p0, p1, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(ILandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 89
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    invoke-virtual {p0, p2, v0, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p3

    .line 90
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v0, v0, Lb/p/d/f;->b:I

    if-ge v0, p3, :cond_1a

    goto :goto_1f

    :cond_1a
    if-gez p1, :cond_1e

    neg-int p1, p3

    goto :goto_1f

    :cond_1e
    move p1, p3

    .line 91
    :goto_1f
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    neg-int v0, p1

    invoke-virtual {p3, v0}, Lb/p/d/i;->a(I)V

    .line 92
    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    iput-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    .line 93
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iput v1, p3, Lb/p/d/f;->b:I

    .line 94
    invoke-virtual {p0, p2, p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;)V

    return p1

    :cond_31
    :goto_31
    return v1
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 77
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->j(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public c()Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .registers 4

    .line 95
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v1, -0x2

    const/4 v2, -0x1

    if-nez v0, :cond_c

    .line 96
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0

    .line 97
    :cond_c
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public final c(III)V
    .registers 10

    .line 79
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v0

    goto :goto_d

    :cond_9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v0

    :goto_d
    const/16 v1, 0x8

    if-ne p3, v1, :cond_1a

    if-ge p1, p2, :cond_16

    add-int/lit8 v2, p2, 0x1

    goto :goto_1c

    :cond_16
    add-int/lit8 v2, p1, 0x1

    move v3, p2

    goto :goto_1d

    :cond_1a
    add-int v2, p1, p2

    :goto_1c
    move v3, p1

    .line 80
    :goto_1d
    iget-object v4, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->e(I)I

    const/4 v4, 0x1

    if-eq p3, v4, :cond_3c

    const/4 v5, 0x2

    if-eq p3, v5, :cond_36

    if-eq p3, v1, :cond_2b

    goto :goto_41

    .line 81
    :cond_2b
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {p3, p1, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b(II)V

    .line 82
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {p1, p2, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(II)V

    goto :goto_41

    .line 83
    :cond_36
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {p3, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b(II)V

    goto :goto_41

    .line 84
    :cond_3c
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {p3, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a(II)V

    :goto_41
    if-gt v2, v0, :cond_44

    return-void

    .line 85
    :cond_44
    iget-boolean p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz p1, :cond_4d

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result p1

    goto :goto_51

    :cond_4d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result p1

    :goto_51
    if-gt v3, p1, :cond_56

    .line 86
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    :cond_56
    return-void
.end method

.method public final c(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V
    .registers 12

    .line 6
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    .line 7
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    const/4 v2, -0x1

    if-nez v1, :cond_b

    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    if-eq v1, v2, :cond_18

    .line 8
    :cond_b
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v1

    if-nez v1, :cond_18

    .line 9
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$u;)V

    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b()V

    return-void

    .line 11
    :cond_18
    iget-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->e:Z

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v1, :cond_29

    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    if-ne v1, v2, :cond_29

    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v1, :cond_27

    goto :goto_29

    :cond_27
    const/4 v1, 0x0

    goto :goto_2a

    :cond_29
    :goto_29
    const/4 v1, 0x1

    :goto_2a
    if-eqz v1, :cond_43

    .line 12
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b()V

    .line 13
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v5, :cond_37

    .line 14
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)V

    goto :goto_3e

    .line 15
    :cond_37
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P()V

    .line 16
    iget-boolean v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    iput-boolean v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    .line 17
    :goto_3e
    invoke-virtual {p0, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)V

    .line 18
    iput-boolean v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->e:Z

    .line 19
    :cond_43
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-nez v5, :cond_60

    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    if-ne v5, v2, :cond_60

    .line 20
    iget-boolean v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    if-ne v5, v6, :cond_59

    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result v5

    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    if-eq v5, v6, :cond_60

    .line 22
    :cond_59
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a()V

    .line 23
    iput-boolean v4, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->d:Z

    .line 24
    :cond_60
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v5

    if-lez v5, :cond_c9

    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v5, :cond_6e

    iget v5, v5, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->j:I

    if-ge v5, v4, :cond_c9

    .line 25
    :cond_6e
    iget-boolean v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->d:Z

    if-eqz v5, :cond_8e

    const/4 v1, 0x0

    .line 26
    :goto_73
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v5, :cond_c9

    .line 27
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v1

    invoke-virtual {v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c()V

    .line 28
    iget v5, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    const/high16 v6, -0x80000000

    if-eq v5, v6, :cond_8b

    .line 29
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v6, v6, v1

    invoke-virtual {v6, v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->d(I)V

    :cond_8b
    add-int/lit8 v1, v1, 0x1

    goto :goto_73

    :cond_8e
    if-nez v1, :cond_af

    .line 30
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    iget-object v1, v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->f:[I

    if-nez v1, :cond_97

    goto :goto_af

    :cond_97
    const/4 v1, 0x0

    .line 31
    :goto_98
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v5, :cond_c9

    .line 32
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v1

    .line 33
    invoke-virtual {v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c()V

    .line 34
    iget-object v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    iget-object v6, v6, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->f:[I

    aget v6, v6, v1

    invoke-virtual {v5, v6}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->d(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_98

    :cond_af
    :goto_af
    const/4 v1, 0x0

    .line 35
    :goto_b0
    iget v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v5, :cond_c2

    .line 36
    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v5, v5, v1

    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    iget v7, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b:I

    invoke-virtual {v5, v6, v7}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(ZI)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_b0

    .line 37
    :cond_c2
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    iget-object v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-virtual {v1, v5}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a([Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;)V

    .line 38
    :cond_c9
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroidx/recyclerview/widget/RecyclerView$u;)V

    .line 39
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iput-boolean v3, v1, Lb/p/d/f;->a:Z

    .line 40
    iput-boolean v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    .line 41
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->g()I

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x(I)V

    .line 42
    iget v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    invoke-virtual {p0, v1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(ILandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 43
    iget-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    if-eqz v1, :cond_fc

    .line 44
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u(I)V

    .line 45
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    invoke-virtual {p0, p1, v1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I

    .line 46
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u(I)V

    .line 47
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    iget v5, v1, Lb/p/d/f;->d:I

    add-int/2addr v2, v5

    iput v2, v1, Lb/p/d/f;->c:I

    .line 48
    invoke-virtual {p0, p1, v1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I

    goto :goto_113

    .line 49
    :cond_fc
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u(I)V

    .line 50
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    invoke-virtual {p0, p1, v1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I

    .line 51
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u(I)V

    .line 52
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iget v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    iget v5, v1, Lb/p/d/f;->d:I

    add-int/2addr v2, v5

    iput v2, v1, Lb/p/d/f;->c:I

    .line 53
    invoke-virtual {p0, p1, v1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Lb/p/d/f;Landroidx/recyclerview/widget/RecyclerView$y;)I

    .line 54
    :goto_113
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->O()V

    .line 55
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v1

    if-lez v1, :cond_12d

    .line 56
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz v1, :cond_127

    .line 57
    invoke-virtual {p0, p1, p2, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V

    .line 58
    invoke-virtual {p0, p1, p2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V

    goto :goto_12d

    .line 59
    :cond_127
    invoke-virtual {p0, p1, p2, v4}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V

    .line 60
    invoke-virtual {p0, p1, p2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V

    :cond_12d
    :goto_12d
    if-eqz p3, :cond_15a

    .line 61
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p3

    if-nez p3, :cond_15a

    .line 62
    iget p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F:I

    if-eqz p3, :cond_14b

    .line 63
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result p3

    if-lez p3, :cond_14b

    iget-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M:Z

    if-nez p3, :cond_149

    .line 64
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L()Landroid/view/View;

    move-result-object p3

    if-eqz p3, :cond_14b

    :cond_149
    const/4 p3, 0x1

    goto :goto_14c

    :cond_14b
    const/4 p3, 0x0

    :goto_14c
    if-eqz p3, :cond_15a

    .line 65
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->P:Ljava/lang/Runnable;

    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Ljava/lang/Runnable;)Z

    .line 66
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G()Z

    move-result p3

    if-eqz p3, :cond_15a

    goto :goto_15b

    :cond_15a
    const/4 v4, 0x0

    .line 67
    :goto_15b
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p3

    if-eqz p3, :cond_166

    .line 68
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    invoke-virtual {p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b()V

    .line 69
    :cond_166
    iget-boolean p3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->c:Z

    iput-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    .line 70
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result p3

    iput-boolean p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    if-eqz v4, :cond_17a

    .line 71
    iget-object p3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    invoke-virtual {p3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b()V

    .line 72
    invoke-virtual {p0, p1, p2, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V

    :cond_17a
    return-void
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)V
    .registers 4

    .line 73
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 74
    :cond_7
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;)Z

    move-result p1

    if-eqz p1, :cond_e

    return-void

    .line 75
    :cond_e
    invoke-virtual {p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a()V

    const/4 p1, 0x0

    .line 76
    iput p1, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->a:I

    return-void
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 4

    const/4 p1, 0x2

    .line 78
    invoke-virtual {p0, p2, p3, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(III)V

    return-void
.end method

.method public c(Z)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Ljava/lang/String;)V

    .line 2
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_e

    iget-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->o:Z

    if-eq v1, p1, :cond_e

    .line 3
    iput-boolean p1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->o:Z

    .line 4
    :cond_e
    iput-boolean p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:Z

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public final d(III)I
    .registers 6

    if-nez p2, :cond_5

    if-nez p3, :cond_5

    return p1

    .line 2
    :cond_5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_13

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_12

    goto :goto_13

    :cond_12
    return p1

    :cond_13
    :goto_13
    const/4 v1, 0x0

    .line 3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    sub-int/2addr p1, p2

    sub-int/2addr p1, p3

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 4
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    return p1
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->h(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    .line 5
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a()V

    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->i(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public e(I)V
    .registers 4

    .line 3
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->e(I)V

    const/4 v0, 0x0

    .line 4
    :goto_4
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v0, v1, :cond_12

    .line 5
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_12
    return-void
.end method

.method public final e(II)V
    .registers 5

    const/4 v0, 0x0

    .line 6
    :goto_1
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v0, v1, :cond_1c

    .line 7
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    iget-object v1, v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_12

    goto :goto_19

    .line 8
    :cond_12
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {p0, v1, p1, p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;II)V

    :goto_19
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1c
    return-void
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 4

    const/4 v0, 0x1

    .line 1
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->c(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)V

    return-void
.end method

.method public f(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->j(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public f(I)V
    .registers 4

    .line 2
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->f(I)V

    const/4 v0, 0x0

    .line 3
    :goto_4
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v0, v1, :cond_12

    .line 4
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    :cond_12
    return-void
.end method

.method public g(I)V
    .registers 2

    if-nez p1, :cond_5

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G()Z

    :cond_5
    return-void
.end method

.method public g(Landroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 2

    .line 2
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->g(Landroidx/recyclerview/widget/RecyclerView$y;)V

    const/4 p1, -0x1

    .line 3
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    const/high16 p1, -0x80000000

    .line 4
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    .line 6
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->L:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$b;->b()V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 8

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_8
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    xor-int/lit8 v0, v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Z)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    xor-int/lit8 v0, v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Z)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    move-object v0, p1

    move-object v4, p0

    .line 5
    invoke-static/range {v0 .. v5}, Lb/p/d/l;->a(Landroidx/recyclerview/widget/RecyclerView$y;Lb/p/d/i;Landroid/view/View;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$o;Z)I

    move-result p1

    return p1
.end method

.method public final i(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 9

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_8
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    xor-int/lit8 v0, v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Z)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    xor-int/lit8 v0, v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Z)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    iget-boolean v6, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    move-object v0, p1

    move-object v4, p0

    .line 5
    invoke-static/range {v0 .. v6}, Lb/p/d/l;->a(Landroidx/recyclerview/widget/RecyclerView$y;Lb/p/d/i;Landroid/view/View;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$o;ZZ)I

    move-result p1

    return p1
.end method

.method public i(I)V
    .registers 4

    .line 6
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_b

    iget v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->h:I

    if-eq v1, p1, :cond_b

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->e()V

    .line 8
    :cond_b
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->C:I

    const/high16 p1, -0x80000000

    .line 9
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->D:I

    .line 10
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public final j(I)I
    .registers 5

    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, -0x1

    const/4 v2, 0x1

    if-nez v0, :cond_e

    .line 7
    iget-boolean p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eqz p1, :cond_d

    const/4 v1, 0x1

    :cond_d
    return v1

    .line 8
    :cond_e
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v0

    if-ge p1, v0, :cond_16

    const/4 p1, 0x1

    goto :goto_17

    :cond_16
    const/4 p1, 0x0

    .line 9
    :goto_17
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eq p1, v0, :cond_1c

    goto :goto_1d

    :cond_1c
    const/4 v1, 0x1

    :goto_1d
    return v1
.end method

.method public final j(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 8

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_8
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    xor-int/lit8 v0, v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->b(Z)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    xor-int/lit8 v0, v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Z)Landroid/view/View;

    move-result-object v3

    iget-boolean v5, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N:Z

    move-object v0, p1

    move-object v4, p0

    .line 5
    invoke-static/range {v0 .. v5}, Lb/p/d/l;->b(Landroidx/recyclerview/widget/RecyclerView$y;Lb/p/d/i;Landroid/view/View;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$o;Z)I

    move-result p1

    return p1
.end method

.method public final k(I)I
    .registers 6

    const/4 v0, -0x1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_47

    const/4 v2, 0x2

    if-eq p1, v2, :cond_3a

    const/16 v2, 0x11

    const/high16 v3, -0x80000000

    if-eq p1, v2, :cond_32

    const/16 v2, 0x21

    if-eq p1, v2, :cond_2a

    const/16 v0, 0x42

    if-eq p1, v0, :cond_22

    const/16 v0, 0x82

    if-eq p1, v0, :cond_1a

    return v3

    .line 1
    :cond_1a
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne p1, v1, :cond_1f

    goto :goto_21

    :cond_1f
    const/high16 v1, -0x80000000

    :goto_21
    return v1

    .line 2
    :cond_22
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-nez p1, :cond_27

    goto :goto_29

    :cond_27
    const/high16 v1, -0x80000000

    :goto_29
    return v1

    .line 3
    :cond_2a
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne p1, v1, :cond_2f

    goto :goto_31

    :cond_2f
    const/high16 v0, -0x80000000

    :goto_31
    return v0

    .line 4
    :cond_32
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-nez p1, :cond_37

    goto :goto_39

    :cond_37
    const/high16 v0, -0x80000000

    :goto_39
    return v0

    .line 5
    :cond_3a
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne p1, v1, :cond_3f

    return v1

    .line 6
    :cond_3f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result p1

    if-eqz p1, :cond_46

    return v0

    :cond_46
    return v1

    .line 7
    :cond_47
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne p1, v1, :cond_4c

    return v0

    .line 8
    :cond_4c
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result p1

    if-eqz p1, :cond_53

    return v1

    :cond_53
    return v0
.end method

.method public final l(I)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    .line 2
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->j:[I

    const/4 v1, 0x0

    .line 3
    :goto_c
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v2, :cond_21

    .line 4
    iget-object v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->j:[I

    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v3

    sub-int v3, p1, v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_21
    return-object v0
.end method

.method public final m(I)Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;
    .registers 6

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;

    invoke-direct {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;-><init>()V

    .line 2
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    new-array v1, v1, [I

    iput-object v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->j:[I

    const/4 v1, 0x0

    .line 3
    :goto_c
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v2, :cond_20

    .line 4
    iget-object v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup$FullSpanItem;->j:[I

    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v3, v3, v1

    invoke-virtual {v3, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v3

    sub-int/2addr v3, p1

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_20
    return-object v0
.end method

.method public final n(I)I
    .registers 6

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_18

    .line 2
    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v3

    .line 3
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v3

    if-ltz v3, :cond_15

    if-ge v3, p1, :cond_15

    return v3

    :cond_15
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_18
    return v1
.end method

.method public final o(I)I
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_18

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v1

    .line 3
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    if-ltz v1, :cond_15

    if-ge v1, p1, :cond_15

    return v1

    :cond_15
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_18
    const/4 p1, 0x0

    return p1
.end method

.method public final p(I)I
    .registers 5

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v0

    const/4 v1, 0x1

    .line 4
    :goto_a
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v2, :cond_1c

    .line 5
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v2

    if-le v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method public final p(Landroid/view/View;)V
    .registers 4

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    add-int/lit8 v0, v0, -0x1

    :goto_4
    if-ltz v0, :cond_10

    .line 2
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(Landroid/view/View;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    :cond_10
    return-void
.end method

.method public final q(I)I
    .registers 5

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v0

    const/4 v1, 0x1

    .line 4
    :goto_a
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v2, :cond_1c

    .line 5
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v2

    if-le v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method public final q(Landroid/view/View;)V
    .registers 4

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    add-int/lit8 v0, v0, -0x1

    :goto_4
    if-ltz v0, :cond_10

    .line 2
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->c(Landroid/view/View;)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    :cond_10
    return-void
.end method

.method public final r(I)I
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    :goto_a
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v2, :cond_1c

    .line 3
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v2

    if-ge v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method public final s(I)I
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v0

    const/4 v1, 0x1

    .line 2
    :goto_a
    iget v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v1, v2, :cond_1c

    .line 3
    iget-object v2, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v2, v2, v1

    invoke-virtual {v2, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v2

    if-ge v2, v0, :cond_19

    move v0, v2

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1c
    return v0
.end method

.method public final t(I)Z
    .registers 6

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_13

    if-ne p1, v1, :cond_b

    const/4 p1, 0x1

    goto :goto_c

    :cond_b
    const/4 p1, 0x0

    .line 2
    :goto_c
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-eq p1, v0, :cond_11

    goto :goto_12

    :cond_11
    const/4 v2, 0x0

    :goto_12
    return v2

    :cond_13
    if-ne p1, v1, :cond_17

    const/4 p1, 0x1

    goto :goto_18

    :cond_17
    const/4 p1, 0x0

    .line 3
    :goto_18
    iget-boolean v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    if-ne p1, v0, :cond_1e

    const/4 p1, 0x1

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x0

    :goto_1f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->N()Z

    move-result v0

    if-ne p1, v0, :cond_26

    goto :goto_27

    :cond_26
    const/4 v2, 0x0

    :goto_27
    return v2
.end method

.method public final u(I)V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->y:Lb/p/d/f;

    iput p1, v0, Lb/p/d/f;->e:I

    .line 2
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->A:Z

    const/4 v2, 0x1

    const/4 v3, -0x1

    if-ne p1, v3, :cond_c

    const/4 p1, 0x1

    goto :goto_d

    :cond_c
    const/4 p1, 0x0

    :goto_d
    if-ne v1, p1, :cond_10

    goto :goto_11

    :cond_10
    const/4 v2, -0x1

    :goto_11
    iput v2, v0, Lb/p/d/f;->d:I

    return-void
.end method

.method public v(I)V
    .registers 3

    if-eqz p1, :cond_e

    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    goto :goto_e

    .line 2
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "invalid orientation."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_e
    :goto_e
    const/4 v0, 0x0

    .line 3
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Ljava/lang/String;)V

    .line 4
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    if-ne p1, v0, :cond_17

    return-void

    .line 5
    :cond_17
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->w:I

    .line 6
    iget-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    iput-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    .line 8
    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public v()Z
    .registers 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->F:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public w(I)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->a(Ljava/lang/String;)V

    .line 2
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-eq p1, v0, :cond_30

    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->M()V

    .line 4
    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    .line 5
    new-instance p1, Ljava/util/BitSet;

    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    invoke-direct {p1, v0}, Ljava/util/BitSet;-><init>(I)V

    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->B:Ljava/util/BitSet;

    .line 6
    iget p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    new-array p1, p1, [Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    iput-object p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    const/4 p1, 0x0

    .line 7
    :goto_1d
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge p1, v0, :cond_2d

    .line 8
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    new-instance v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    invoke-direct {v1, p0, p1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager;I)V

    aput-object v1, v0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_1d

    .line 9
    :cond_2d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    :cond_30
    return-void
.end method

.method public x(I)V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    div-int v0, p1, v0

    iput v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->x:I

    .line 2
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->v:Lb/p/d/i;

    .line 3
    invoke-virtual {v0}, Lb/p/d/i;->d()I

    move-result v0

    .line 4
    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    iput p1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J:I

    return-void
.end method

.method public y()Landroid/os/Parcelable;
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    if-eqz v0, :cond_c

    .line 2
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;-><init>(Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;)V

    return-object v0

    .line 3
    :cond_c
    new-instance v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;

    invoke-direct {v0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;-><init>()V

    .line 4
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->z:Z

    iput-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->o:Z

    .line 5
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    iput-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->p:Z

    .line 6
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->H:Z

    iput-boolean v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->q:Z

    .line 7
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->E:Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;

    const/4 v2, 0x0

    if-eqz v1, :cond_30

    iget-object v3, v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->a:[I

    if-eqz v3, :cond_30

    .line 8
    iput-object v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->m:[I

    .line 9
    array-length v3, v3

    iput v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->l:I

    .line 10
    iget-object v1, v1, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$LazySpanLookup;->b:Ljava/util/List;

    iput-object v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->n:Ljava/util/List;

    goto :goto_32

    .line 11
    :cond_30
    iput v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->l:I

    .line 12
    :goto_32
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v1

    if-lez v1, :cond_88

    .line 13
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    if-eqz v1, :cond_41

    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->K()I

    move-result v1

    goto :goto_45

    .line 14
    :cond_41
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->J()I

    move-result v1

    :goto_45
    iput v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->h:I

    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->I()I

    move-result v1

    iput v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->i:I

    .line 16
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    iput v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->j:I

    .line 17
    new-array v1, v1, [I

    iput-object v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->k:[I

    .line 18
    :goto_55
    iget v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->s:I

    if-ge v2, v1, :cond_8f

    .line 19
    iget-boolean v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->G:Z

    const/high16 v3, -0x80000000

    if-eqz v1, :cond_70

    .line 20
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v2

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->a(I)I

    move-result v1

    if-eq v1, v3, :cond_81

    .line 21
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3}, Lb/p/d/i;->b()I

    move-result v3

    goto :goto_80

    .line 22
    :cond_70
    iget-object v1, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->t:[Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    aget-object v1, v1, v2

    invoke-virtual {v1, v3}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->b(I)I

    move-result v1

    if-eq v1, v3, :cond_81

    .line 23
    iget-object v3, p0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3}, Lb/p/d/i;->f()I

    move-result v3

    :goto_80
    sub-int/2addr v1, v3

    .line 24
    :cond_81
    iget-object v3, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->k:[I

    aput v1, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_55

    :cond_88
    const/4 v1, -0x1

    .line 25
    iput v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->h:I

    .line 26
    iput v1, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->i:I

    .line 27
    iput v2, v0, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$SavedState;->j:I

    :cond_8f
    return-object v0
.end method
