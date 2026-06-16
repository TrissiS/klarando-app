.class public Lb/p/d/d$b;
.super Landroidx/recyclerview/widget/RecyclerView$s;
.source "FastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lb/p/d/d;


# direct methods
.method public constructor <init>(Lb/p/d/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/p/d/d$b;->a:Lb/p/d/d;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$s;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 4

    .line 1
    iget-object p2, p0, Lb/p/d/d$b;->a:Lb/p/d/d;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    move-result p3

    .line 2
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result p1

    .line 3
    invoke-virtual {p2, p3, p1}, Lb/p/d/d;->a(II)V

    return-void
.end method
