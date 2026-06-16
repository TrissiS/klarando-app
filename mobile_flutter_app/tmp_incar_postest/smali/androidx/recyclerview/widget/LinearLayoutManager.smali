.class public Landroidx/recyclerview/widget/LinearLayoutManager;
.super Landroidx/recyclerview/widget/RecyclerView$o;
.source "LinearLayoutManager.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$x$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/recyclerview/widget/LinearLayoutManager$b;,
        Landroidx/recyclerview/widget/LinearLayoutManager$a;,
        Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;,
        Landroidx/recyclerview/widget/LinearLayoutManager$c;
    }
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:Z

.field public D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

.field public final E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

.field public final F:Landroidx/recyclerview/widget/LinearLayoutManager$b;

.field public G:I

.field public H:[I

.field public s:I

.field public t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

.field public u:Lb/p/d/i;

.field public v:Z

.field public w:Z

.field public x:Z

.field public y:Z

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IZ)V
    .registers 5

    .line 2
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    const/4 p1, 0x1

    .line 3
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->w:Z

    .line 5
    iput-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    .line 6
    iput-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    .line 7
    iput-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    const/4 p1, -0x1

    .line 8
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    const/high16 p1, -0x80000000

    .line 9
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    const/4 p1, 0x0

    .line 10
    iput-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    .line 11
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-direct {p1}, Landroidx/recyclerview/widget/LinearLayoutManager$a;-><init>()V

    iput-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    .line 12
    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager$b;

    invoke-direct {p1}, Landroidx/recyclerview/widget/LinearLayoutManager$b;-><init>()V

    iput-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->F:Landroidx/recyclerview/widget/LinearLayoutManager$b;

    const/4 p1, 0x2

    .line 13
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->G:I

    new-array p1, p1, [I

    .line 14
    iput-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    .line 15
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->k(I)V

    .line 16
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7

    .line 17
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$o;-><init>()V

    const/4 v0, 0x1

    .line 18
    iput v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    const/4 v1, 0x0

    .line 19
    iput-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->w:Z

    .line 20
    iput-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    .line 21
    iput-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    .line 22
    iput-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    const/4 v0, -0x1

    .line 23
    iput v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    const/high16 v0, -0x80000000

    .line 24
    iput v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    .line 26
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$a;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    .line 27
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager$b;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$b;-><init>()V

    iput-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->F:Landroidx/recyclerview/widget/LinearLayoutManager$b;

    const/4 v0, 0x2

    .line 28
    iput v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->G:I

    new-array v0, v0, [I

    .line 29
    iput-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    .line 30
    invoke-static {p1, p2, p3, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroidx/recyclerview/widget/RecyclerView$o$d;

    move-result-object p1

    .line 31
    iget p2, p1, Landroidx/recyclerview/widget/RecyclerView$o$d;->a:I

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->k(I)V

    .line 32
    iget-boolean p2, p1, Landroidx/recyclerview/widget/RecyclerView$o$d;->c:Z

    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Z)V

    .line 33
    iget-boolean p1, p1, Landroidx/recyclerview/widget/RecyclerView$o$d;->d:Z

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(Z)V

    return-void
.end method


# virtual methods
.method public B()Z
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->i()I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-eq v0, v1, :cond_16

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->s()I

    move-result v0

    if-eq v0, v1, :cond_16

    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->t()Z

    move-result v0

    if-eqz v0, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    return v0
.end method

.method public D()Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_c

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->v:Z

    iget-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public E()Landroidx/recyclerview/widget/LinearLayoutManager$c;
    .registers 2

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$c;-><init>()V

    return-object v0
.end method

.method public F()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    if-nez v0, :cond_a

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->E()Landroidx/recyclerview/widget/LinearLayoutManager$c;

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    :cond_a
    return-void
.end method

.method public final G()Landroid/view/View;
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->e(II)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public H()I
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v0, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZZ)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_e

    const/4 v0, -0x1

    goto :goto_12

    .line 2
    :cond_e
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    :goto_12
    return v0
.end method

.method public final I()Landroid/view/View;
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->e(II)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public J()I
    .registers 5

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZZ)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_f

    goto :goto_13

    .line 2
    :cond_f
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v2

    :goto_13
    return v2
.end method

.method public final K()Landroid/view/View;
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->G()Landroid/view/View;

    move-result-object v0

    goto :goto_d

    .line 2
    :cond_9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->I()Landroid/view/View;

    move-result-object v0

    :goto_d
    return-object v0
.end method

.method public final L()Landroid/view/View;
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->I()Landroid/view/View;

    move-result-object v0

    goto :goto_d

    .line 2
    :cond_9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->G()Landroid/view/View;

    move-result-object v0

    :goto_d
    return-object v0
.end method

.method public final M()Landroid/view/View;
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_6

    const/4 v0, 0x0

    goto :goto_c

    :cond_6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_c
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public final N()Landroid/view/View;
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public O()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    return v0
.end method

.method public P()Z
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

.method public Q()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    return v0
.end method

.method public R()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->d()I

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 2
    invoke-virtual {v0}, Lb/p/d/i;->a()I

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    return v0
.end method

.method public final S()V
    .registers 3

    .line 1
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_12

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->P()Z

    move-result v0

    if-nez v0, :cond_c

    goto :goto_12

    .line 2
    :cond_c
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->w:Z

    xor-int/2addr v0, v1

    iput-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    goto :goto_16

    .line 3
    :cond_12
    :goto_12
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->w:Z

    iput-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    :goto_16
    return-void
.end method

.method public a(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 6

    .line 83
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_7

    const/4 p1, 0x0

    return p1

    .line 84
    :cond_7
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public final a(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)I
    .registers 6

    .line 78
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    sub-int/2addr v0, p1

    if-lez v0, :cond_23

    neg-int v0, v0

    .line 79
    invoke-virtual {p0, v0, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p2

    neg-int p2, p2

    add-int/2addr p1, p2

    if-eqz p4, :cond_22

    .line 80
    iget-object p3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p3}, Lb/p/d/i;->b()I

    move-result p3

    sub-int/2addr p3, p1

    if-lez p3, :cond_22

    .line 81
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1, p3}, Lb/p/d/i;->a(I)V

    add-int/2addr p3, p2

    return p3

    :cond_22
    return p2

    :cond_23
    const/4 p1, 0x0

    return p1
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I
    .registers 12

    .line 139
    iget v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    .line 140
    iget v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    const/high16 v2, -0x80000000

    if-eq v1, v2, :cond_10

    if-gez v0, :cond_d

    add-int/2addr v1, v0

    .line 141
    iput v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    .line 142
    :cond_d
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;)V

    .line 143
    :cond_10
    iget v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    iget v3, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    add-int/2addr v1, v3

    .line 144
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->F:Landroidx/recyclerview/widget/LinearLayoutManager$b;

    .line 145
    :cond_17
    iget-boolean v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->m:Z

    if-nez v4, :cond_1d

    if-lez v1, :cond_68

    :cond_1d
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a(Landroidx/recyclerview/widget/RecyclerView$y;)Z

    move-result v4

    if-eqz v4, :cond_68

    .line 146
    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a()V

    .line 147
    invoke-virtual {p0, p1, p3, p2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/LinearLayoutManager$b;)V

    .line 148
    iget-boolean v4, v3, Landroidx/recyclerview/widget/LinearLayoutManager$b;->b:Z

    if-eqz v4, :cond_2e

    goto :goto_68

    .line 149
    :cond_2e
    iget v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    iget v5, v3, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    iget v6, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    mul-int v5, v5, v6

    add-int/2addr v4, v5

    iput v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 150
    iget-boolean v4, v3, Landroidx/recyclerview/widget/LinearLayoutManager$b;->c:Z

    if-eqz v4, :cond_47

    iget-object v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->l:Ljava/util/List;

    if-nez v4, :cond_47

    .line 151
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v4

    if-nez v4, :cond_4f

    .line 152
    :cond_47
    iget v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    iget v5, v3, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    sub-int/2addr v4, v5

    iput v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    sub-int/2addr v1, v5

    .line 153
    :cond_4f
    iget v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    if-eq v4, v2, :cond_62

    .line 154
    iget v5, v3, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    add-int/2addr v4, v5

    iput v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    .line 155
    iget v5, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    if-gez v5, :cond_5f

    add-int/2addr v4, v5

    .line 156
    iput v4, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    .line 157
    :cond_5f
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;)V

    :cond_62
    if-eqz p4, :cond_17

    .line 158
    iget-boolean v4, v3, Landroidx/recyclerview/widget/LinearLayoutManager$b;->d:Z

    if-eqz v4, :cond_17

    .line 159
    :cond_68
    :goto_68
    iget p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    sub-int/2addr v0, p1

    return v0
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 85
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->h(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public a(I)Landroid/graphics/PointF;
    .registers 5

    .line 21
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return-object p1

    :cond_8
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    const/4 v2, 0x1

    if-ge p1, v1, :cond_15

    const/4 v0, 0x1

    .line 23
    :cond_15
    iget-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eq v0, p1, :cond_1a

    const/4 v2, -0x1

    .line 24
    :cond_1a
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    const/4 v0, 0x0

    if-nez p1, :cond_26

    .line 25
    new-instance p1, Landroid/graphics/PointF;

    int-to-float v1, v2

    invoke-direct {p1, v1, v0}, Landroid/graphics/PointF;-><init>(FF)V

    return-object p1

    .line 26
    :cond_26
    new-instance p1, Landroid/graphics/PointF;

    int-to-float v1, v2

    invoke-direct {p1, v0, v1}, Landroid/graphics/PointF;-><init>(FF)V

    return-object p1
.end method

.method public a(IIZZ)Landroid/view/View;
    .registers 6

    .line 205
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    const/16 v0, 0x140

    if-eqz p3, :cond_a

    const/16 p3, 0x6003

    goto :goto_c

    :cond_a
    const/16 p3, 0x140

    :goto_c
    if-eqz p4, :cond_f

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    .line 206
    :goto_10
    iget p4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez p4, :cond_1b

    iget-object p4, p0, Landroidx/recyclerview/widget/RecyclerView$o;->e:Lb/p/d/o;

    .line 207
    invoke-virtual {p4, p1, p2, p3, v0}, Lb/p/d/o;->a(IIII)Landroid/view/View;

    move-result-object p1

    goto :goto_21

    :cond_1b
    iget-object p4, p0, Landroidx/recyclerview/widget/RecyclerView$o;->f:Lb/p/d/o;

    .line 208
    invoke-virtual {p4, p1, p2, p3, v0}, Lb/p/d/o;->a(IIII)Landroid/view/View;

    move-result-object p1

    :goto_21
    return-object p1
.end method

.method public a(Landroid/view/View;ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;
    .registers 8

    .line 209
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->S()V

    .line 210
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result p1

    const/4 v0, 0x0

    if-nez p1, :cond_b

    return-object v0

    .line 211
    :cond_b
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->j(I)I

    move-result p1

    const/high16 p2, -0x80000000

    if-ne p1, p2, :cond_14

    return-object v0

    .line 212
    :cond_14
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    const v1, 0x3eaaaaab

    .line 213
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->g()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v1

    float-to-int v1, v2

    const/4 v2, 0x0

    .line 214
    invoke-virtual {p0, p1, v1, v2, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZLandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 215
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p2, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    .line 216
    iput-boolean v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a:Z

    const/4 p2, 0x1

    .line 217
    invoke-virtual {p0, p3, v1, p4, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    const/4 p2, -0x1

    if-ne p1, p2, :cond_3a

    .line 218
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->L()Landroid/view/View;

    move-result-object p3

    goto :goto_3e

    .line 219
    :cond_3a
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->K()Landroid/view/View;

    move-result-object p3

    :goto_3e
    if-ne p1, p2, :cond_45

    .line 220
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->N()Landroid/view/View;

    move-result-object p1

    goto :goto_49

    .line 221
    :cond_45
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->M()Landroid/view/View;

    move-result-object p1

    .line 222
    :goto_49
    invoke-virtual {p1}, Landroid/view/View;->hasFocusable()Z

    move-result p2

    if-eqz p2, :cond_53

    if-nez p3, :cond_52

    return-object v0

    :cond_52
    return-object p1

    :cond_53
    return-object p3
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;III)Landroid/view/View;
    .registers 11

    .line 197
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 198
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->f()I

    move-result p1

    .line 199
    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p2}, Lb/p/d/i;->b()I

    move-result p2

    if-le p4, p3, :cond_13

    const/4 v0, 0x1

    goto :goto_14

    :cond_13
    const/4 v0, -0x1

    :goto_14
    const/4 v1, 0x0

    move-object v2, v1

    :goto_16
    if-eq p3, p4, :cond_4b

    .line 200
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v3

    .line 201
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v4

    if-ltz v4, :cond_49

    if-ge v4, p5, :cond_49

    .line 202
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    check-cast v4, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->c()Z

    move-result v4

    if-eqz v4, :cond_34

    if-nez v2, :cond_49

    move-object v2, v3

    goto :goto_49

    .line 203
    :cond_34
    iget-object v4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v4, v3}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v4

    if-ge v4, p2, :cond_46

    iget-object v4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 204
    invoke-virtual {v4, v3}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v4

    if-ge v4, p1, :cond_45

    goto :goto_46

    :cond_45
    return-object v3

    :cond_46
    :goto_46
    if-nez v1, :cond_49

    move-object v1, v3

    :cond_49
    :goto_49
    add-int/2addr p3, v0

    goto :goto_16

    :cond_4b
    if-eqz v1, :cond_4e

    goto :goto_4f

    :cond_4e
    move-object v1, v2

    :goto_4f
    return-object v1
.end method

.method public a(ZZ)Landroid/view/View;
    .registers 5

    .line 194
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_e

    const/4 v0, 0x0

    .line 195
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZZ)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 196
    :cond_e
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZZ)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a(IILandroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$o$c;)V
    .registers 6

    .line 123
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez v0, :cond_5

    goto :goto_6

    :cond_5
    move p1, p2

    .line 124
    :goto_6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result p2

    if-eqz p2, :cond_24

    if-nez p1, :cond_f

    goto :goto_24

    .line 125
    :cond_f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    const/4 p2, 0x1

    if-lez p1, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    const/4 v0, -0x1

    .line 126
    :goto_18
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    .line 127
    invoke-virtual {p0, v0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZLandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 128
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0, p3, p1, p4}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$o$c;)V

    :cond_24
    :goto_24
    return-void
.end method

.method public final a(IIZLandroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 9

    .line 86
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->R()Z

    move-result v1

    iput-boolean v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->m:Z

    .line 87
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    .line 88
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    const/4 v1, 0x0

    aput v1, v0, v1

    const/4 v2, 0x1

    .line 89
    aput v1, v0, v2

    .line 90
    invoke-virtual {p0, p4, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$y;[I)V

    .line 91
    iget-object p4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    aget p4, p4, v1

    invoke-static {v1, p4}, Ljava/lang/Math;->max(II)I

    move-result p4

    .line 92
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    aget v0, v0, v2

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    if-ne p1, v2, :cond_2a

    const/4 v1, 0x1

    .line 93
    :cond_2a
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    if-eqz v1, :cond_30

    move v3, v0

    goto :goto_31

    :cond_30
    move v3, p4

    :goto_31
    iput v3, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 94
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    if-eqz v1, :cond_38

    goto :goto_39

    :cond_38
    move p4, v0

    :goto_39
    iput p4, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->i:I

    const/4 p1, -0x1

    if-eqz v1, :cond_7b

    .line 95
    iget-object p4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v0, p4, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->c()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p4, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 96
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->M()Landroid/view/View;

    move-result-object p4

    .line 97
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v1, :cond_56

    const/4 v2, -0x1

    :cond_56
    iput v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    .line 98
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    add-int/2addr v0, v2

    iput v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 99
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1, p4}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result p1

    iput p1, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 100
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1, p4}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result p1

    iget-object p4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 101
    invoke-virtual {p4}, Lb/p/d/i;->b()I

    move-result p4

    sub-int/2addr p1, p4

    goto :goto_b9

    .line 102
    :cond_7b
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->N()Landroid/view/View;

    move-result-object p4

    .line 103
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3}, Lb/p/d/i;->f()I

    move-result v3

    add-int/2addr v1, v3

    iput v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 104
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v1, :cond_93

    goto :goto_94

    :cond_93
    const/4 v2, -0x1

    :goto_94
    iput v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    .line 105
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0, p4}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    add-int/2addr v0, v2

    iput v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 106
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1, p4}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result p1

    iput p1, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 107
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1, p4}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result p1

    neg-int p1, p1

    iget-object p4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 108
    invoke-virtual {p4}, Lb/p/d/i;->f()I

    move-result p4

    add-int/2addr p1, p4

    .line 109
    :goto_b9
    iget-object p4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p2, p4, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    if-eqz p3, :cond_c2

    sub-int/2addr p2, p1

    .line 110
    iput p2, p4, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    .line 111
    :cond_c2
    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    return-void
.end method

.method public a(ILandroidx/recyclerview/widget/RecyclerView$o$c;)V
    .registers 8

    .line 115
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_13

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->e()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 116
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iget-boolean v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->j:Z

    .line 117
    iget v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->h:I

    goto :goto_22

    .line 118
    :cond_13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->S()V

    .line 119
    iget-boolean v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    .line 120
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    if-ne v0, v1, :cond_22

    if-eqz v3, :cond_21

    add-int/lit8 v0, p1, -0x1

    goto :goto_22

    :cond_21
    const/4 v0, 0x0

    :cond_22
    :goto_22
    if-eqz v3, :cond_25

    goto :goto_26

    :cond_25
    const/4 v1, 0x1

    :goto_26
    const/4 v3, 0x0

    .line 121
    :goto_27
    iget v4, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->G:I

    if-ge v3, v4, :cond_36

    if-ltz v0, :cond_36

    if-ge v0, p1, :cond_36

    .line 122
    invoke-interface {p2, v0, v2}, Landroidx/recyclerview/widget/RecyclerView$o$c;->a(II)V

    add-int/2addr v0, v1

    add-int/lit8 v3, v3, 0x1

    goto :goto_27

    :cond_36
    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 3

    .line 5
    instance-of v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_b

    .line 6
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iput-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    :cond_b
    return-void
.end method

.method public a(Landroid/view/accessibility/AccessibilityEvent;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-lez v0, :cond_17

    .line 3
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->H()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setFromIndex(I)V

    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->J()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/accessibility/AccessibilityEvent;->setToIndex(I)V

    :cond_17
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/LinearLayoutManager$a;)V
    .registers 3

    .line 82
    iget v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b:I

    iget p1, p1, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->f(II)V

    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;II)V
    .registers 4

    if-ne p2, p3, :cond_3

    return-void

    :cond_3
    if-le p3, p2, :cond_f

    add-int/lit8 p3, p3, -0x1

    :goto_7
    if-lt p3, p2, :cond_17

    .line 131
    invoke-virtual {p0, p3, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(ILandroidx/recyclerview/widget/RecyclerView$u;)V

    add-int/lit8 p3, p3, -0x1

    goto :goto_7

    :cond_f
    :goto_f
    if-le p2, p3, :cond_17

    .line 132
    invoke-virtual {p0, p2, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(ILandroidx/recyclerview/widget/RecyclerView$u;)V

    add-int/lit8 p2, p2, -0x1

    goto :goto_f

    :cond_17
    return-void
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;)V
    .registers 6

    .line 133
    iget-boolean v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->m:Z

    if-eqz v0, :cond_9

    goto :goto_19

    .line 134
    :cond_9
    iget v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    .line 135
    iget v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->i:I

    .line 136
    iget p2, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    const/4 v2, -0x1

    if-ne p2, v2, :cond_16

    .line 137
    invoke-virtual {p0, p1, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;II)V

    goto :goto_19

    .line 138
    :cond_16
    invoke-virtual {p0, p1, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(Landroidx/recyclerview/widget/RecyclerView$u;II)V

    :cond_19
    :goto_19
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;I)V
    .registers 5

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/LinearLayoutManager$b;)V
    .registers 12

    .line 160
    invoke-virtual {p3, p1}, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a(Landroidx/recyclerview/widget/RecyclerView$u;)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x1

    if-nez p1, :cond_a

    .line 161
    iput-boolean p2, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->b:Z

    return-void

    .line 162
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 163
    iget-object v0, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->l:Ljava/util/List;

    const/4 v1, -0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2a

    .line 164
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    if-ne v3, v1, :cond_1f

    const/4 v3, 0x1

    goto :goto_20

    :cond_1f
    const/4 v3, 0x0

    :goto_20
    if-ne v0, v3, :cond_26

    .line 165
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroid/view/View;)V

    goto :goto_3c

    .line 166
    :cond_26
    invoke-virtual {p0, p1, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroid/view/View;I)V

    goto :goto_3c

    .line 167
    :cond_2a
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    if-ne v3, v1, :cond_32

    const/4 v3, 0x1

    goto :goto_33

    :cond_32
    const/4 v3, 0x0

    :goto_33
    if-ne v0, v3, :cond_39

    .line 168
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;)V

    goto :goto_3c

    .line 169
    :cond_39
    invoke-virtual {p0, p1, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;I)V

    .line 170
    :goto_3c
    invoke-virtual {p0, p1, v2, v2}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;II)V

    .line 171
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0, p1}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v0

    iput v0, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    .line 172
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-ne v0, p2, :cond_85

    .line 173
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->P()Z

    move-result v0

    if-eqz v0, :cond_63

    .line 174
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->r()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->p()I

    move-result v2

    sub-int/2addr v0, v2

    .line 175
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p1}, Lb/p/d/i;->c(Landroid/view/View;)I

    move-result v2

    sub-int v2, v0, v2

    goto :goto_6e

    .line 176
    :cond_63
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->o()I

    move-result v2

    .line 177
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0, p1}, Lb/p/d/i;->c(Landroid/view/View;)I

    move-result v0

    add-int/2addr v0, v2

    .line 178
    :goto_6e
    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    if-ne v3, v1, :cond_7c

    .line 179
    iget p3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 180
    iget v1, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    sub-int v1, p3, v1

    move v5, p3

    move v4, v0

    move v3, v1

    goto :goto_a8

    .line 181
    :cond_7c
    iget p3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 182
    iget v1, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    add-int/2addr v1, p3

    move v3, p3

    move v4, v0

    move v5, v1

    goto :goto_a8

    .line 183
    :cond_85
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v0

    .line 184
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p1}, Lb/p/d/i;->c(Landroid/view/View;)I

    move-result v2

    add-int/2addr v2, v0

    .line 185
    iget v3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    if-ne v3, v1, :cond_9f

    .line 186
    iget p3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 187
    iget v1, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    sub-int v1, p3, v1

    move v4, p3

    move v3, v0

    move v5, v2

    move v2, v1

    goto :goto_a8

    .line 188
    :cond_9f
    iget p3, p3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 189
    iget v1, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->a:I

    add-int/2addr v1, p3

    move v3, v0

    move v4, v1

    move v5, v2

    move v2, p3

    :goto_a8
    move-object v0, p0

    move-object v1, p1

    .line 190
    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;IIII)V

    .line 191
    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->c()Z

    move-result p3

    if-nez p3, :cond_b9

    invoke-virtual {v6}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;->b()Z

    move-result p3

    if-eqz p3, :cond_bb

    .line 192
    :cond_b9
    iput-boolean p2, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->c:Z

    .line 193
    :cond_bb
    invoke-virtual {p1}, Landroid/view/View;->hasFocusable()Z

    move-result p1

    iput-boolean p1, p4, Landroidx/recyclerview/widget/LinearLayoutManager$b;->d:Z

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$o$c;)V
    .registers 5

    .line 112
    iget v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    if-ltz v0, :cond_14

    .line 113
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    if-ge v0, p1, :cond_14

    const/4 p1, 0x0

    .line 114
    iget p2, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-interface {p3, v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o$c;->a(II)V

    :cond_14
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$y;[I)V
    .registers 6

    .line 13
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->k(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    .line 14
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    const/4 v0, 0x0

    goto :goto_10

    :cond_e
    move v0, p1

    const/4 p1, 0x0

    .line 15
    :goto_10
    aput p1, p2, v1

    const/4 p1, 0x1

    .line 16
    aput v0, p2, p1

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$y;I)V
    .registers 4

    .line 17
    new-instance p2, Lb/p/d/g;

    .line 18
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lb/p/d/g;-><init>(Landroid/content/Context;)V

    .line 19
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView$x;->c(I)V

    .line 20
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$x;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .registers 3

    .line 129
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-nez v0, :cond_7

    .line 130
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Ljava/lang/String;)V

    :cond_7
    return-void
.end method

.method public a(Z)V
    .registers 3

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Ljava/lang/String;)V

    .line 10
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->w:Z

    if-ne p1, v0, :cond_9

    return-void

    .line 11
    :cond_9
    iput-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->w:Z

    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public a()Z
    .registers 2

    .line 8
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;)Z
    .registers 8

    .line 27
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 28
    :cond_8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->g()Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1d

    .line 29
    invoke-virtual {p3, v0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$y;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 30
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p3, v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b(Landroid/view/View;I)V

    return v2

    .line 31
    :cond_1d
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->v:Z

    iget-boolean v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    if-eq v0, v3, :cond_24

    return v1

    .line 32
    :cond_24
    iget-boolean v0, p3, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz v0, :cond_2d

    .line 33
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->h(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;

    move-result-object p1

    goto :goto_31

    .line 34
    :cond_2d
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->i(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;

    move-result-object p1

    :goto_31
    if-eqz p1, :cond_79

    .line 35
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v0

    invoke-virtual {p3, p1, v0}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->a(Landroid/view/View;I)V

    .line 36
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p2

    if-nez p2, :cond_78

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->D()Z

    move-result p2

    if-eqz p2, :cond_78

    .line 37
    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 38
    invoke-virtual {p2, p1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result p2

    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 39
    invoke-virtual {v0}, Lb/p/d/i;->b()I

    move-result v0

    if-ge p2, v0, :cond_62

    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 40
    invoke-virtual {p2, p1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result p1

    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 41
    invoke-virtual {p2}, Lb/p/d/i;->f()I

    move-result p2

    if-ge p1, p2, :cond_63

    :cond_62
    const/4 v1, 0x1

    :cond_63
    if-eqz v1, :cond_78

    .line 42
    iget-boolean p1, p3, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz p1, :cond_70

    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 43
    invoke-virtual {p1}, Lb/p/d/i;->b()I

    move-result p1

    goto :goto_76

    :cond_70
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 44
    invoke-virtual {p1}, Lb/p/d/i;->f()I

    move-result p1

    :goto_76
    iput p1, p3, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    :cond_78
    return v2

    :cond_79
    return v1
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;)Z
    .registers 7

    .line 45
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_fc

    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_e

    goto/16 :goto_fc

    :cond_e
    const/high16 v3, -0x80000000

    if-ltz v0, :cond_f8

    .line 46
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    if-lt v0, p1, :cond_1a

    goto/16 :goto_f8

    .line 47
    :cond_1a
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b:I

    .line 48
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    const/4 v0, 0x1

    if-eqz p1, :cond_4d

    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->e()Z

    move-result p1

    if-eqz p1, :cond_4d

    .line 49
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iget-boolean p1, p1, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->j:Z

    iput-boolean p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz p1, :cond_3f

    .line 50
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->b()I

    move-result p1

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iget v1, v1, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->i:I

    sub-int/2addr p1, v1

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    goto :goto_4c

    .line 51
    :cond_3f
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->f()I

    move-result p1

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iget v1, v1, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->i:I

    add-int/2addr p1, v1

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    :goto_4c
    return v0

    .line 52
    :cond_4d
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    if-ne p1, v3, :cond_da

    .line 53
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_ba

    .line 54
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p1}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v2

    .line 55
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3}, Lb/p/d/i;->g()I

    move-result v3

    if-le v2, v3, :cond_6b

    .line 56
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->a()V

    return v0

    .line 57
    :cond_6b
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v2

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 58
    invoke-virtual {v3}, Lb/p/d/i;->f()I

    move-result v3

    sub-int/2addr v2, v3

    if-gez v2, :cond_85

    .line 59
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->f()I

    move-result p1

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    .line 60
    iput-boolean v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    return v0

    .line 61
    :cond_85
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 62
    invoke-virtual {v2, p1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v2

    sub-int/2addr v1, v2

    if-gez v1, :cond_9f

    .line 63
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->b()I

    move-result p1

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    .line 64
    iput-boolean v0, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    return v0

    .line 65
    :cond_9f
    iget-boolean v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz v1, :cond_b1

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 66
    invoke-virtual {v1, p1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result p1

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 67
    invoke-virtual {v1}, Lb/p/d/i;->h()I

    move-result v1

    add-int/2addr p1, v1

    goto :goto_b7

    :cond_b1
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 68
    invoke-virtual {v1, p1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result p1

    :goto_b7
    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    goto :goto_d9

    .line 69
    :cond_ba
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result p1

    if-lez p1, :cond_d6

    .line 70
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result p1

    .line 71
    iget v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    if-ge v2, p1, :cond_ce

    const/4 p1, 0x1

    goto :goto_cf

    :cond_ce
    const/4 p1, 0x0

    :goto_cf
    iget-boolean v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-ne p1, v2, :cond_d4

    const/4 v1, 0x1

    :cond_d4
    iput-boolean v1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    .line 72
    :cond_d6
    invoke-virtual {p2}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->a()V

    :goto_d9
    return v0

    .line 73
    :cond_da
    iget-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    iput-boolean p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz p1, :cond_ec

    .line 74
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->b()I

    move-result p1

    iget v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    sub-int/2addr p1, v1

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    goto :goto_f7

    .line 75
    :cond_ec
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->f()I

    move-result p1

    iget v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    add-int/2addr p1, v1

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    :goto_f7
    return v0

    .line 76
    :cond_f8
    :goto_f8
    iput v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    .line 77
    iput v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    :cond_fc
    :goto_fc
    return v1
.end method

.method public b(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 5

    .line 44
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez v0, :cond_6

    const/4 p1, 0x0

    return p1

    .line 45
    :cond_6
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public final b(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)I
    .registers 6

    .line 39
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v0}, Lb/p/d/i;->f()I

    move-result v0

    sub-int v0, p1, v0

    if-lez v0, :cond_23

    .line 40
    invoke-virtual {p0, v0, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p2

    neg-int p2, p2

    add-int/2addr p1, p2

    if-eqz p4, :cond_22

    .line 41
    iget-object p3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p3}, Lb/p/d/i;->f()I

    move-result p3

    sub-int/2addr p1, p3

    if-lez p1, :cond_22

    .line 42
    iget-object p3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    neg-int p4, p1

    invoke-virtual {p3, p4}, Lb/p/d/i;->a(I)V

    sub-int/2addr p2, p1

    :cond_22
    return p2

    :cond_23
    const/4 p1, 0x0

    return p1
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 46
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->i(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public b(ZZ)Landroid/view/View;
    .registers 5

    .line 58
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_10

    .line 59
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZZ)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_10
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v1

    invoke-virtual {p0, v0, v1, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZZ)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final b(Landroidx/recyclerview/widget/LinearLayoutManager$a;)V
    .registers 3

    .line 43
    iget v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b:I

    iget p1, p1, Landroidx/recyclerview/widget/LinearLayoutManager$a;->c:I

    invoke-virtual {p0, v0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->g(II)V

    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$u;II)V
    .registers 8

    .line 47
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-gez p2, :cond_7

    return-void

    .line 48
    :cond_7
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->a()I

    move-result v1

    sub-int/2addr v1, p2

    add-int/2addr v1, p3

    .line 49
    iget-boolean p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz p2, :cond_33

    const/4 p2, 0x0

    const/4 p3, 0x0

    :goto_15
    if-ge p3, v0, :cond_53

    .line 50
    invoke-virtual {p0, p3}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v2

    .line 51
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3, v2}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v3

    if-lt v3, v1, :cond_2f

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 52
    invoke-virtual {v3, v2}, Lb/p/d/i;->f(Landroid/view/View;)I

    move-result v2

    if-ge v2, v1, :cond_2c

    goto :goto_2f

    :cond_2c
    add-int/lit8 p3, p3, 0x1

    goto :goto_15

    .line 53
    :cond_2f
    :goto_2f
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;II)V

    return-void

    :cond_33
    add-int/lit8 v0, v0, -0x1

    move p2, v0

    :goto_36
    if-ltz p2, :cond_53

    .line 54
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object p3

    .line 55
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, p3}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v2

    if-lt v2, v1, :cond_50

    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 56
    invoke-virtual {v2, p3}, Lb/p/d/i;->f(Landroid/view/View;)I

    move-result p3

    if-ge p3, v1, :cond_4d

    goto :goto_50

    :cond_4d
    add-int/lit8 p2, p2, -0x1

    goto :goto_36

    .line 57
    :cond_50
    :goto_50
    invoke-virtual {p0, p1, v0, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;II)V

    :cond_53
    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;II)V
    .registers 20

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    .line 10
    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView$y;->e()Z

    move-result v3

    if-eqz v3, :cond_ad

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v3

    if-eqz v3, :cond_ad

    invoke-virtual/range {p2 .. p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v3

    if-nez v3, :cond_ad

    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->D()Z

    move-result v3

    if-nez v3, :cond_1f

    goto/16 :goto_ad

    .line 12
    :cond_1f
    invoke-virtual/range {p1 .. p1}, Landroidx/recyclerview/widget/RecyclerView$u;->f()Ljava/util/List;

    move-result-object v3

    .line 13
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x0

    .line 14
    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p0, v6}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    :goto_33
    if-ge v7, v4, :cond_6a

    .line 15
    invoke-interface {v3, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Landroidx/recyclerview/widget/RecyclerView$b0;

    .line 16
    invoke-virtual {v10}, Landroidx/recyclerview/widget/RecyclerView$b0;->r()Z

    move-result v11

    if-eqz v11, :cond_42

    goto :goto_67

    .line 17
    :cond_42
    invoke-virtual {v10}, Landroidx/recyclerview/widget/RecyclerView$b0;->j()I

    move-result v11

    const/4 v12, 0x1

    if-ge v11, v6, :cond_4b

    const/4 v11, 0x1

    goto :goto_4c

    :cond_4b
    const/4 v11, 0x0

    .line 18
    :goto_4c
    iget-boolean v13, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    const/4 v14, -0x1

    if-eq v11, v13, :cond_52

    const/4 v12, -0x1

    :cond_52
    if-ne v12, v14, :cond_5e

    .line 19
    iget-object v11, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v11, v10}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v10

    add-int/2addr v8, v10

    goto :goto_67

    .line 20
    :cond_5e
    iget-object v11, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    iget-object v10, v10, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    invoke-virtual {v11, v10}, Lb/p/d/i;->b(Landroid/view/View;)I

    move-result v10

    add-int/2addr v9, v10

    :goto_67
    add-int/lit8 v7, v7, 0x1

    goto :goto_33

    .line 21
    :cond_6a
    iget-object v4, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput-object v3, v4, Landroidx/recyclerview/widget/LinearLayoutManager$c;->l:Ljava/util/List;

    if-lez v8, :cond_8b

    .line 22
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->N()Landroid/view/View;

    move-result-object v3

    .line 23
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v3

    move/from16 v4, p3

    invoke-virtual {p0, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->g(II)V

    .line 24
    iget-object v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v8, v3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 25
    iput v5, v3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    .line 26
    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a()V

    .line 27
    iget-object v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0, v1, v3, v2, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    :cond_8b
    if-lez v9, :cond_a8

    .line 28
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->M()Landroid/view/View;

    move-result-object v3

    .line 29
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v3

    move/from16 v4, p4

    invoke-virtual {p0, v3, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->f(II)V

    .line 30
    iget-object v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v9, v3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 31
    iput v5, v3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    .line 32
    invoke-virtual {v3}, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a()V

    .line 33
    iget-object v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0, v1, v3, v2, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 34
    :cond_a8
    iget-object v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    const/4 v2, 0x0

    iput-object v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->l:Ljava/util/List;

    :cond_ad
    :goto_ad
    return-void
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;)V
    .registers 5

    .line 35
    invoke-virtual {p0, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 36
    :cond_7
    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;)Z

    move-result p1

    if-eqz p1, :cond_e

    return-void

    .line 37
    :cond_e
    invoke-virtual {p3}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->a()V

    .line 38
    iget-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    if-eqz p1, :cond_1c

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    goto :goto_1d

    :cond_1c
    const/4 p1, 0x0

    :goto_1d
    iput p1, p3, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b:I

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$u;)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$u;)V

    .line 2
    iget-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->C:Z

    if-eqz p1, :cond_d

    .line 3
    invoke-virtual {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$u;)V

    .line 4
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$u;->a()V

    :cond_d
    return-void
.end method

.method public b(Z)V
    .registers 3

    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Ljava/lang/String;)V

    .line 7
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    if-ne v0, p1, :cond_9

    return-void

    .line 8
    :cond_9
    iput-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public b()Z
    .registers 3

    .line 5
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_6

    goto :goto_7

    :cond_6
    const/4 v1, 0x0

    :goto_7
    return v1
.end method

.method public c(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 9

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_39

    if-nez p1, :cond_a

    goto :goto_39

    .line 9
    :cond_a
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 10
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    const/4 v2, 0x1

    iput-boolean v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a:Z

    if-lez p1, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, -0x1

    .line 11
    :goto_17
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v3

    .line 12
    invoke-virtual {p0, v0, v3, v2, p3}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(IIZLandroidx/recyclerview/widget/RecyclerView$y;)V

    .line 13
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v4, v2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    .line 14
    invoke-virtual {p0, p2, v2, p3, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    move-result p2

    add-int/2addr v4, p2

    if-gez v4, :cond_2a

    return v1

    :cond_2a
    if-le v3, v4, :cond_2e

    mul-int p1, v0, v4

    .line 15
    :cond_2e
    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    neg-int p3, p1

    invoke-virtual {p2, p3}, Lb/p/d/i;->a(I)V

    .line 16
    iget-object p2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p1, p2, Landroidx/recyclerview/widget/LinearLayoutManager$c;->k:I

    return p1

    :cond_39
    :goto_39
    return v1
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 7
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->j(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public c(I)Landroid/view/View;
    .registers 4

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return-object p1

    :cond_8
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    sub-int v1, p1, v1

    if-ltz v1, :cond_22

    if-ge v1, v0, :cond_22

    .line 4
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    if-ne v1, p1, :cond_22

    return-object v0

    .line 6
    :cond_22
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->c(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public c()Landroidx/recyclerview/widget/RecyclerView$LayoutParams;
    .registers 3

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public final c(Landroidx/recyclerview/widget/RecyclerView$u;II)V
    .registers 8

    if-gez p2, :cond_3

    return-void

    :cond_3
    sub-int/2addr p2, p3

    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result p3

    .line 18
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_2d

    add-int/lit8 p3, p3, -0x1

    move v0, p3

    :goto_f
    if-ltz v0, :cond_4c

    .line 19
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v1

    .line 20
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, v1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v2

    if-gt v2, p2, :cond_29

    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 21
    invoke-virtual {v2, v1}, Lb/p/d/i;->e(Landroid/view/View;)I

    move-result v1

    if-le v1, p2, :cond_26

    goto :goto_29

    :cond_26
    add-int/lit8 v0, v0, -0x1

    goto :goto_f

    .line 22
    :cond_29
    :goto_29
    invoke-virtual {p0, p1, p3, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;II)V

    return-void

    :cond_2d
    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_2f
    if-ge v1, p3, :cond_4c

    .line 23
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v2

    .line 24
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3, v2}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v3

    if-gt v3, p2, :cond_49

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 25
    invoke-virtual {v3, v2}, Lb/p/d/i;->e(Landroid/view/View;)I

    move-result v2

    if-le v2, p2, :cond_46

    goto :goto_49

    :cond_46
    add-int/lit8 v1, v1, 0x1

    goto :goto_2f

    .line 26
    :cond_49
    :goto_49
    invoke-virtual {p0, p1, v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;II)V

    :cond_4c
    return-void
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->h(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 89
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->i(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public e(II)Landroid/view/View;
    .registers 6

    .line 90
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    if-le p2, p1, :cond_7

    const/4 v0, 0x1

    goto :goto_c

    :cond_7
    if-ge p2, p1, :cond_b

    const/4 v0, -0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-nez v0, :cond_13

    .line 91
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 92
    :cond_13
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->d(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v0

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 93
    invoke-virtual {v1}, Lb/p/d/i;->f()I

    move-result v1

    if-ge v0, v1, :cond_2a

    const/16 v0, 0x4104

    const/16 v1, 0x4004

    goto :goto_2e

    :cond_2a
    const/16 v0, 0x1041

    const/16 v1, 0x1001

    .line 94
    :goto_2e
    iget v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez v2, :cond_39

    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$o;->e:Lb/p/d/o;

    .line 95
    invoke-virtual {v2, p1, p2, v0, v1}, Lb/p/d/o;->a(IIII)Landroid/view/View;

    move-result-object p1

    goto :goto_3f

    :cond_39
    iget-object v2, p0, Landroidx/recyclerview/widget/RecyclerView$o;->f:Lb/p/d/o;

    .line 96
    invoke-virtual {v2, p1, p2, v0, v1}, Lb/p/d/o;->a(IIII)Landroid/view/View;

    move-result-object p1

    :goto_3f
    return-object p1
.end method

.method public e(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 11

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    const/4 v1, -0x1

    if-nez v0, :cond_9

    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    if-eq v0, v1, :cond_13

    .line 2
    :cond_9
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v0

    if-nez v0, :cond_13

    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->b(Landroidx/recyclerview/widget/RecyclerView$u;)V

    return-void

    .line 4
    :cond_13
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_23

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->e()Z

    move-result v0

    if-eqz v0, :cond_23

    .line 5
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iget v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->h:I

    iput v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    .line 6
    :cond_23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    const/4 v2, 0x0

    iput-boolean v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->a:Z

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->S()V

    .line 9
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->g()Landroid/view/View;

    move-result-object v0

    .line 10
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    iget-boolean v3, v3, Landroidx/recyclerview/widget/LinearLayoutManager$a;->e:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_6a

    iget v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    if-ne v3, v1, :cond_6a

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-eqz v3, :cond_42

    goto :goto_6a

    :cond_42
    if-eqz v0, :cond_7f

    .line 11
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v3, v0}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v3

    iget-object v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 12
    invoke-virtual {v5}, Lb/p/d/i;->b()I

    move-result v5

    if-ge v3, v5, :cond_60

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 13
    invoke-virtual {v3, v0}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v3

    iget-object v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 14
    invoke-virtual {v5}, Lb/p/d/i;->f()I

    move-result v5

    if-gt v3, v5, :cond_7f

    .line 15
    :cond_60
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v5

    invoke-virtual {v3, v0, v5}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b(Landroid/view/View;I)V

    goto :goto_7f

    .line 16
    :cond_6a
    :goto_6a
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b()V

    .line 17
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    iget-boolean v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    xor-int/2addr v3, v5

    iput-boolean v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    .line 18
    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;)V

    .line 19
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    iput-boolean v4, v0, Landroidx/recyclerview/widget/LinearLayoutManager$a;->e:Z

    .line 20
    :cond_7f
    :goto_7f
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->k:I

    if-ltz v3, :cond_87

    const/4 v3, 0x1

    goto :goto_88

    :cond_87
    const/4 v3, -0x1

    :goto_88
    iput v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    .line 21
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    aput v2, v0, v2

    .line 22
    aput v2, v0, v4

    .line 23
    invoke-virtual {p0, p2, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$y;[I)V

    .line 24
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    aget v0, v0, v2

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 25
    invoke-virtual {v3}, Lb/p/d/i;->f()I

    move-result v3

    add-int/2addr v0, v3

    .line 26
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->H:[I

    aget v3, v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    iget-object v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 27
    invoke-virtual {v5}, Lb/p/d/i;->c()I

    move-result v5

    add-int/2addr v3, v5

    .line 28
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v5

    if-eqz v5, :cond_f0

    iget v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    if-eq v5, v1, :cond_f0

    iget v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    const/high16 v7, -0x80000000

    if-eq v6, v7, :cond_f0

    .line 29
    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->c(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_f0

    .line 30
    iget-boolean v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v6, :cond_db

    .line 31
    iget-object v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v6}, Lb/p/d/i;->b()I

    move-result v6

    iget-object v7, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 32
    invoke-virtual {v7, v5}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v5

    sub-int/2addr v6, v5

    .line 33
    iget v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    goto :goto_ea

    .line 34
    :cond_db
    iget-object v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v6, v5}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v5

    iget-object v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 35
    invoke-virtual {v6}, Lb/p/d/i;->f()I

    move-result v6

    sub-int/2addr v5, v6

    .line 36
    iget v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    :goto_ea
    sub-int/2addr v6, v5

    if-lez v6, :cond_ef

    add-int/2addr v0, v6

    goto :goto_f0

    :cond_ef
    sub-int/2addr v3, v6

    .line 37
    :cond_f0
    :goto_f0
    iget-object v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    iget-boolean v5, v5, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz v5, :cond_fc

    .line 38
    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v5, :cond_100

    :cond_fa
    const/4 v1, 0x1

    goto :goto_100

    .line 39
    :cond_fc
    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v5, :cond_fa

    .line 40
    :cond_100
    :goto_100
    iget-object v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {p0, p1, p2, v5, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/LinearLayoutManager$a;I)V

    .line 41
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroidx/recyclerview/widget/RecyclerView$u;)V

    .line 42
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->R()Z

    move-result v5

    iput-boolean v5, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->m:Z

    .line 43
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result v5

    iput-boolean v5, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->j:Z

    .line 44
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v2, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->i:I

    .line 45
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    iget-boolean v5, v1, Landroidx/recyclerview/widget/LinearLayoutManager$a;->d:Z

    if-eqz v5, :cond_161

    .line 46
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(Landroidx/recyclerview/widget/LinearLayoutManager$a;)V

    .line 47
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v0, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 48
    invoke-virtual {p0, p1, v1, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 49
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 50
    iget v5, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 51
    iget v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    if-lez v0, :cond_137

    add-int/2addr v3, v0

    .line 52
    :cond_137
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/LinearLayoutManager$a;)V

    .line 53
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 54
    iget v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    iget v6, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    add-int/2addr v3, v6

    iput v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 55
    invoke-virtual {p0, p1, v0, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 56
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 57
    iget v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    if-lez v0, :cond_19f

    .line 58
    invoke-virtual {p0, v5, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->g(II)V

    .line 59
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v0, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 60
    invoke-virtual {p0, p1, v1, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 61
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    goto :goto_19f

    .line 62
    :cond_161
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/LinearLayoutManager$a;)V

    .line 63
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v3, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 64
    invoke-virtual {p0, p1, v1, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 65
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v3, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 66
    iget v5, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 67
    iget v1, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    if-lez v1, :cond_176

    add-int/2addr v0, v1

    .line 68
    :cond_176
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(Landroidx/recyclerview/widget/LinearLayoutManager$a;)V

    .line 69
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v0, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 70
    iget v0, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    iget v6, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    add-int/2addr v0, v6

    iput v0, v1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 71
    invoke-virtual {p0, p1, v1, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 72
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 73
    iget v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    if-lez v0, :cond_19f

    .line 74
    invoke-virtual {p0, v5, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->f(II)V

    .line 75
    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v0, v3, Landroidx/recyclerview/widget/LinearLayoutManager$c;->h:I

    .line 76
    invoke-virtual {p0, p1, v3, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/LinearLayoutManager$c;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    .line 77
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget v3, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    .line 78
    :cond_19f
    :goto_19f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-lez v0, :cond_1c3

    .line 79
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    xor-int/2addr v0, v5

    if-eqz v0, :cond_1b7

    .line 80
    invoke-virtual {p0, v3, p1, p2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    move-result v0

    add-int/2addr v1, v0

    add-int/2addr v3, v0

    .line 81
    invoke-virtual {p0, v1, p1, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    move-result v0

    goto :goto_1c1

    .line 82
    :cond_1b7
    invoke-virtual {p0, v1, p1, p2, v4}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    move-result v0

    add-int/2addr v1, v0

    add-int/2addr v3, v0

    .line 83
    invoke-virtual {p0, v3, p1, p2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(ILandroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;Z)I

    move-result v0

    :goto_1c1
    add-int/2addr v1, v0

    add-int/2addr v3, v0

    .line 84
    :cond_1c3
    invoke-virtual {p0, p1, p2, v1, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;II)V

    .line 85
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->d()Z

    move-result p1

    if-nez p1, :cond_1d2

    .line 86
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->i()V

    goto :goto_1d7

    .line 87
    :cond_1d2
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b()V

    .line 88
    :goto_1d7
    iget-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->y:Z

    iput-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->v:Z

    return-void
.end method

.method public f(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2

    .line 7
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->j(Landroidx/recyclerview/widget/RecyclerView$y;)I

    move-result p1

    return p1
.end method

.method public final f(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;
    .registers 9

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v4

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v5

    const/4 v3, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;III)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final f(II)V
    .registers 6

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->b()I

    move-result v1

    sub-int/2addr v1, p2

    iput v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    .line 2
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_14

    const/4 v1, -0x1

    goto :goto_15

    :cond_14
    const/4 v1, 0x1

    :goto_15
    iput v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    .line 3
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 4
    iput v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    .line 5
    iput p2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    const/high16 p1, -0x80000000

    .line 6
    iput p1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    return-void
.end method

.method public final g(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;
    .registers 10

    .line 12
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    add-int/lit8 v4, v0, -0x1

    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$y;->a()I

    move-result v6

    const/4 v5, -0x1

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-virtual/range {v1 .. v6}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;III)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public final g(II)V
    .registers 5

    .line 6
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v1}, Lb/p/d/i;->f()I

    move-result v1

    sub-int v1, p2, v1

    iput v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->c:I

    .line 7
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput p1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->d:I

    .line 8
    iget-boolean p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    const/4 v1, -0x1

    if-eqz p1, :cond_17

    const/4 p1, 0x1

    goto :goto_18

    :cond_17
    const/4 p1, -0x1

    :goto_18
    iput p1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$c;->e:I

    .line 9
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->t:Landroidx/recyclerview/widget/LinearLayoutManager$c;

    iput v1, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->f:I

    .line 10
    iput p2, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->b:I

    const/high16 p2, -0x80000000

    .line 11
    iput p2, p1, Landroidx/recyclerview/widget/LinearLayoutManager$c;->g:I

    return-void
.end method

.method public g(Landroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->g(Landroidx/recyclerview/widget/RecyclerView$y;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    const/4 p1, -0x1

    .line 3
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    const/high16 p1, -0x80000000

    .line 4
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    .line 5
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager$a;->b()V

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
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    .line 4
    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    xor-int/2addr v0, v2

    .line 5
    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    move-object v0, p1

    move-object v2, v3

    move-object v3, v4

    move-object v4, p0

    .line 6
    invoke-static/range {v0 .. v5}, Lb/p/d/l;->a(Landroidx/recyclerview/widget/RecyclerView$y;Lb/p/d/i;Landroid/view/View;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$o;Z)I

    move-result p1

    return p1
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;
    .registers 4

    .line 7
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->f(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;

    move-result-object p1

    goto :goto_d

    .line 8
    :cond_9
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->g(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;

    move-result-object p1

    :goto_d
    return-object p1
.end method

.method public final i(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 9

    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 7
    :cond_8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 8
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    .line 9
    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    xor-int/2addr v0, v2

    .line 10
    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    iget-boolean v6, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    move-object v0, p1

    move-object v2, v3

    move-object v3, v4

    move-object v4, p0

    .line 11
    invoke-static/range {v0 .. v6}, Lb/p/d/l;->a(Landroidx/recyclerview/widget/RecyclerView$y;Lb/p/d/i;Landroid/view/View;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$o;ZZ)I

    move-result p1

    return p1
.end method

.method public final i(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;
    .registers 4

    .line 12
    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    if-eqz v0, :cond_9

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->g(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;

    move-result-object p1

    goto :goto_d

    .line 13
    :cond_9
    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/LinearLayoutManager;->f(Landroidx/recyclerview/widget/RecyclerView$u;Landroidx/recyclerview/widget/RecyclerView$y;)Landroid/view/View;

    move-result-object p1

    :goto_d
    return-object p1
.end method

.method public i(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->A:I

    const/high16 p1, -0x80000000

    .line 2
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->B:I

    .line 3
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-eqz p1, :cond_d

    .line 4
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->f()V

    .line 5
    :cond_d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    return-void
.end method

.method public j(I)I
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

    .line 7
    :cond_1a
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-ne p1, v1, :cond_1f

    goto :goto_21

    :cond_1f
    const/high16 v1, -0x80000000

    :goto_21
    return v1

    .line 8
    :cond_22
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez p1, :cond_27

    goto :goto_29

    :cond_27
    const/high16 v1, -0x80000000

    :goto_29
    return v1

    .line 9
    :cond_2a
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-ne p1, v1, :cond_2f

    goto :goto_31

    :cond_2f
    const/high16 v0, -0x80000000

    :goto_31
    return v0

    .line 10
    :cond_32
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-nez p1, :cond_37

    goto :goto_39

    :cond_37
    const/high16 v0, -0x80000000

    :goto_39
    return v0

    .line 11
    :cond_3a
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-ne p1, v1, :cond_3f

    return v1

    .line 12
    :cond_3f
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->P()Z

    move-result p1

    if-eqz p1, :cond_46

    return v0

    :cond_46
    return v1

    .line 13
    :cond_47
    iget p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-ne p1, v1, :cond_4c

    return v0

    .line 14
    :cond_4c
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->P()Z

    move-result p1

    if-eqz p1, :cond_53

    return v1

    :cond_53
    return v0
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
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 3
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    const/4 v2, 0x1

    xor-int/2addr v0, v2

    .line 4
    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->b(ZZ)Landroid/view/View;

    move-result-object v3

    iget-boolean v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    xor-int/2addr v0, v2

    .line 5
    invoke-virtual {p0, v0, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(ZZ)Landroid/view/View;

    move-result-object v4

    iget-boolean v5, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->z:Z

    move-object v0, p1

    move-object v2, v3

    move-object v3, v4

    move-object v4, p0

    .line 6
    invoke-static/range {v0 .. v5}, Lb/p/d/l;->b(Landroidx/recyclerview/widget/RecyclerView$y;Lb/p/d/i;Landroid/view/View;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$o;Z)I

    move-result p1

    return p1
.end method

.method public k(Landroidx/recyclerview/widget/RecyclerView$y;)I
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 8
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$y;->c()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 9
    iget-object p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {p1}, Lb/p/d/i;->g()I

    move-result p1

    return p1

    :cond_d
    const/4 p1, 0x0

    return p1
.end method

.method public k(I)V
    .registers 5

    if-eqz p1, :cond_1d

    const/4 v0, 0x1

    if-ne p1, v0, :cond_6

    goto :goto_1d

    .line 1
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid orientation:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1d
    :goto_1d
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->a(Ljava/lang/String;)V

    .line 3
    iget v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    if-ne p1, v0, :cond_29

    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    if-nez v0, :cond_38

    .line 4
    :cond_29
    invoke-static {p0, p1}, Lb/p/d/i;->a(Landroidx/recyclerview/widget/RecyclerView$o;I)Lb/p/d/i;

    move-result-object v0

    iput-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 5
    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->E:Landroidx/recyclerview/widget/LinearLayoutManager$a;

    iput-object v0, v1, Landroidx/recyclerview/widget/LinearLayoutManager$a;->a:Lb/p/d/i;

    .line 6
    iput p1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->s:I

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->z()V

    :cond_38
    return-void
.end method

.method public v()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public y()Landroid/os/Parcelable;
    .registers 5

    .line 1
    iget-object v0, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    if-eqz v0, :cond_c

    .line 2
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    iget-object v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->D:Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    invoke-direct {v0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;-><init>(Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;)V

    return-object v0

    .line 3
    :cond_c
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;-><init>()V

    .line 4
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->e()I

    move-result v1

    if-lez v1, :cond_57

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->F()V

    .line 6
    iget-boolean v1, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->v:Z

    iget-boolean v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->x:Z

    xor-int/2addr v1, v2

    .line 7
    iput-boolean v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->j:Z

    if-eqz v1, :cond_3d

    .line 8
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->M()Landroid/view/View;

    move-result-object v1

    .line 9
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2}, Lb/p/d/i;->b()I

    move-result v2

    iget-object v3, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 10
    invoke-virtual {v3, v1}, Lb/p/d/i;->a(Landroid/view/View;)I

    move-result v3

    sub-int/2addr v2, v3

    iput v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->i:I

    .line 11
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v1

    iput v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->h:I

    goto :goto_5a

    .line 12
    :cond_3d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->N()Landroid/view/View;

    move-result-object v1

    .line 13
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->l(Landroid/view/View;)I

    move-result v2

    iput v2, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->h:I

    .line 14
    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    invoke-virtual {v2, v1}, Lb/p/d/i;->d(Landroid/view/View;)I

    move-result v1

    iget-object v2, p0, Landroidx/recyclerview/widget/LinearLayoutManager;->u:Lb/p/d/i;

    .line 15
    invoke-virtual {v2}, Lb/p/d/i;->f()I

    move-result v2

    sub-int/2addr v1, v2

    iput v1, v0, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->i:I

    goto :goto_5a

    .line 16
    :cond_57
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager$SavedState;->f()V

    :goto_5a
    return-object v0
.end method
