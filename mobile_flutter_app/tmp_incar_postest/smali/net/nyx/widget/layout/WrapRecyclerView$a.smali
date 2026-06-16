.class public final Lnet/nyx/widget/layout/WrapRecyclerView$a;
.super Landroidx/recyclerview/widget/RecyclerView$i;
.source "WrapRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/nyx/widget/layout/WrapRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public final a:Lnet/nyx/widget/layout/WrapRecyclerView$b;


# direct methods
.method public constructor <init>(Lnet/nyx/widget/layout/WrapRecyclerView$b;)V
    .registers 2

    .line 2
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$i;-><init>()V

    .line 3
    iput-object p1, p0, Lnet/nyx/widget/layout/WrapRecyclerView$a;->a:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    return-void
.end method

.method public synthetic constructor <init>(Lnet/nyx/widget/layout/WrapRecyclerView$b;Ld/a/d/h/a;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lnet/nyx/widget/layout/WrapRecyclerView$a;-><init>(Lnet/nyx/widget/layout/WrapRecyclerView$b;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$a;->a:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    return-void
.end method

.method public a(II)V
    .registers 5

    .line 3
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$a;->a:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Lnet/nyx/widget/layout/WrapRecyclerView$b;)I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v0, v1, p2}, Landroidx/recyclerview/widget/RecyclerView$g;->a(II)V

    return-void
.end method

.method public a(IILjava/lang/Object;)V
    .registers 6

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/layout/WrapRecyclerView$a;->a:Lnet/nyx/widget/layout/WrapRecyclerView$b;

    invoke-static {v0}, Lnet/nyx/widget/layout/WrapRecyclerView$b;->a(Lnet/nyx/widget/layout/WrapRecyclerView$b;)I

    move-result v1

    add-int/2addr v1, p1

    invoke-virtual {v0, v1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$g;->a(IILjava/lang/Object;)V

    return-void
.end method
