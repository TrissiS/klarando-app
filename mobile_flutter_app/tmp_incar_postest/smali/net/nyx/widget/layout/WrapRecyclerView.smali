.class public final Lnet/nyx/widget/layout/WrapRecyclerView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "WrapRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/nyx/widget/layout/WrapRecyclerView$a;,
        Lnet/nyx/widget/layout/WrapRecyclerView$c;,
        Lnet/nyx/widget/layout/WrapRecyclerView$b;
    }
.end annotation


# instance fields
.field public O0:Landroidx/recyclerview/widget/RecyclerView$g;

.field public final P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Lnet/nyx/widget/layout/WrapRecyclerView$b;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;-><init>(Ld/a/d/h/a;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    new-instance p1, Lnet/nyx/widget/layout/WrapRecyclerView$b;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lnet/nyx/widget/layout/WrapRecyclerView$b;-><init>(Ld/a/d/h/a;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 5
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 6
    new-instance p1, Lnet/nyx/widget/layout/WrapRecyclerView$b;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Lnet/nyx/widget/layout/WrapRecyclerView$b;-><init>(Ld/a/d/h/a;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    return-void
.end method


# virtual methods
.method public getAdapter()Landroidx/recyclerview/widget/RecyclerView$g;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->O0:Landroidx/recyclerview/widget/RecyclerView$g;

    return-object v0
.end method

.method public getFooterViews()Ljava/util/List;
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
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->d(Lnet/nyx/widget/layout/WrapRecyclerView$b;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFooterViewsCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->b(Lnet/nyx/widget/layout/WrapRecyclerView$b;)I

    move-result v0

    return v0
.end method

.method public getHeaderViews()Ljava/util/List;
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
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->c(Lnet/nyx/widget/layout/WrapRecyclerView$b;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderViewsCount()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Lnet/nyx/widget/layout/WrapRecyclerView$b;)I

    move-result v0

    return v0
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->O0:Landroidx/recyclerview/widget/RecyclerView$g;

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0, p1}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Lnet/nyx/widget/layout/WrapRecyclerView$b;Landroidx/recyclerview/widget/RecyclerView$g;)V

    const/4 p1, 0x0

    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$l;)V

    .line 4
    iget-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView;->P0:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$g;)V

    return-void
.end method
