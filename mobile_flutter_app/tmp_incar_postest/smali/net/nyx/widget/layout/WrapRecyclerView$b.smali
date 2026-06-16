.class public final Lnet/nyx/widget/layout/WrapRecyclerView$b;
.super Landroidx/recyclerview/widget/RecyclerView$g;
.source "WrapRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/widget/layout/WrapRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$g<",
        "Landroidx/recyclerview/widget/RecyclerView$b0;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Landroidx/recyclerview/widget/RecyclerView$g;

.field public final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public m:I

.field public n:Landroidx/recyclerview/widget/RecyclerView;

.field public o:Lnet/nyx/widget/layout/WrapRecyclerView$a;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$g;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k:Ljava/util/List;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->l:Ljava/util/List;

    return-void
.end method

.method public synthetic constructor <init>(Ld/a/d/h/a;)V
    .registers 2

    .line 4
    invoke-direct {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;-><init>()V

    return-void
.end method

.method public static synthetic a(Lnet/nyx/widget/layout/WrapRecyclerView$b;)I
    .registers 1

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result p0

    return p0
.end method

.method public static synthetic a(Lnet/nyx/widget/layout/WrapRecyclerView$b;Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Landroidx/recyclerview/widget/RecyclerView$g;)V

    return-void
.end method

.method public static synthetic b(Lnet/nyx/widget/layout/WrapRecyclerView$b;)I
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->h()I

    move-result p0

    return p0
.end method

.method public static synthetic c(Lnet/nyx/widget/layout/WrapRecyclerView$b;)Ljava/util/List;
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->i()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d(Lnet/nyx/widget/layout/WrapRecyclerView$b;)Ljava/util/List;
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->g()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final a(Landroid/view/View;)Lnet/nyx/widget/layout/WrapRecyclerView$c;
    .registers 4

    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    .line 13
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_d

    .line 14
    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 15
    :cond_d
    new-instance v0, Lnet/nyx/widget/layout/WrapRecyclerView$c;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lnet/nyx/widget/layout/WrapRecyclerView$c;-><init>(Landroid/view/View;Ld/a/d/h/a;)V

    return-object v0
.end method

.method public final a(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 4

    .line 3
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    if-eqz v0, :cond_e

    .line 4
    iget-object v1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->o:Lnet/nyx/widget/layout/WrapRecyclerView$a;

    if-eqz v1, :cond_e

    .line 5
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(Landroidx/recyclerview/widget/RecyclerView$i;)V

    .line 6
    :cond_e
    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez p1, :cond_13

    return-void

    .line 7
    :cond_13
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->o:Lnet/nyx/widget/layout/WrapRecyclerView$a;

    if-nez p1, :cond_1f

    .line 8
    new-instance p1, Lnet/nyx/widget/layout/WrapRecyclerView$a;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lnet/nyx/widget/layout/WrapRecyclerView$a;-><init>(Lnet/nyx/widget/layout/WrapRecyclerView$b;Ld/a/d/h/a;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->o:Lnet/nyx/widget/layout/WrapRecyclerView$a;

    .line 9
    :cond_1f
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->o:Lnet/nyx/widget/layout/WrapRecyclerView$a;

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView$i;)V

    .line 10
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->n:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_2d

    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    :cond_2d
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 16
    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 17
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_7

    return-void

    .line 18
    :cond_7
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$b0;)Z
    .registers 3

    .line 19
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_9

    .line 20
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result p1

    return p1

    .line 21
    :cond_9
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->a(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result p1

    return p1
.end method

.method public b()I
    .registers 3

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v0, :cond_9

    .line 3
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    .line 4
    :goto_a
    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->h()I

    move-result v0

    add-int/2addr v1, v0

    return v1
.end method

.method public b(I)J
    .registers 4

    .line 14
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_25

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v0

    iget-object v1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v1

    add-int/2addr v0, v1

    if-ge p1, v0, :cond_25

    .line 15
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v1

    sub-int/2addr p1, v1

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(I)J

    move-result-wide v0

    return-wide v0

    .line 16
    :cond_25
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public b(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$b0;
    .registers 7

    const/high16 v0, -0x40000000    # -2.0f

    if-eq p2, v0, :cond_50

    const v1, 0x3fffffff    # 1.9999999f

    if-eq p2, v1, :cond_2f

    .line 5
    iget-object p2, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k()I

    move-result v2

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p2, v2}, Landroidx/recyclerview/widget/RecyclerView$g;->c(I)I

    move-result p2

    if-eq p2, v0, :cond_27

    if-eq p2, v1, :cond_27

    .line 6
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_22

    const/4 p1, 0x0

    return-object p1

    .line 7
    :cond_22
    invoke-virtual {v0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$g;->b(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$b0;

    move-result-object p1

    return-object p1

    .line 8
    :cond_27
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Please do not use this type as itemType"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 9
    :cond_2f
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->l:Ljava/util/List;

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k()I

    move-result p2

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v0

    sub-int/2addr p2, v0

    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v0, :cond_43

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v0

    goto :goto_44

    :cond_43
    const/4 v0, 0x0

    :goto_44
    sub-int/2addr p2, v0

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Landroid/view/View;)Lnet/nyx/widget/layout/WrapRecyclerView$c;

    move-result-object p1

    return-object p1

    .line 10
    :cond_50
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k:Ljava/util/List;

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k()I

    move-result p2

    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Landroid/view/View;)Lnet/nyx/widget/layout/WrapRecyclerView$c;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 3

    .line 20
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_5

    return-void

    .line 21
    :cond_5
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$b0;I)V
    .registers 5

    .line 11
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_5

    return-void

    .line 12
    :cond_5
    invoke-virtual {p0, p2}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->c(I)I

    move-result p2

    const/high16 v0, -0x40000000    # -2.0f

    if-eq p2, v0, :cond_20

    const v0, 0x3fffffff    # 1.9999999f

    if-eq p2, v0, :cond_20

    .line 13
    iget-object p2, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k()I

    move-result v0

    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p2, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$g;->b(Landroidx/recyclerview/widget/RecyclerView$b0;I)V

    :cond_20
    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->n:Landroidx/recyclerview/widget/RecyclerView;

    .line 18
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_8

    return-void

    .line 19
    :cond_8
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->b(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public c(I)I
    .registers 5

    .line 2
    iput p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->m:I

    .line 3
    invoke-virtual {p0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j()I

    move-result v0

    .line 4
    iget-object v1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$g;->b()I

    move-result v1

    goto :goto_10

    :cond_f
    const/4 v1, 0x0

    :goto_10
    sub-int v2, p1, v0

    if-ge p1, v0, :cond_17

    const/high16 p1, -0x40000000    # -2.0f

    return p1

    :cond_17
    if-ge v2, v1, :cond_20

    .line 5
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView$g;->c(I)I

    move-result p1

    return p1

    :cond_20
    const p1, 0x3fffffff    # 1.9999999f

    return p1
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 3

    .line 6
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_5

    return-void

    .line 7
    :cond_5
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->c(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 3

    .line 2
    instance-of v0, p1, Lnet/nyx/widget/layout/WrapRecyclerView$c;

    if-eqz v0, :cond_9

    const/4 v0, 0x0

    .line 3
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$b0;->a(Z)V

    return-void

    .line 4
    :cond_9
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->j:Landroidx/recyclerview/widget/RecyclerView$g;

    if-nez v0, :cond_e

    return-void

    .line 5
    :cond_e
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$g;->d(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final g()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->l:Ljava/util/List;

    return-object v0
.end method

.method public final h()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->l:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public final i()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k:Ljava/util/List;

    return-object v0
.end method

.method public final j()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->k:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public k()I
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$b;->m:I

    return v0
.end method
