.class public Lb/p/d/n$a;
.super Landroidx/recyclerview/widget/RecyclerView$s;
.source "SnapHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/p/d/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Z

.field public final synthetic b:Lb/p/d/n;


# direct methods
.method public constructor <init>(Lb/p/d/n;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/p/d/n$a;->b:Lb/p/d/n;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$s;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lb/p/d/n$a;->a:Z

    return-void
.end method


# virtual methods
.method public a(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 3

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$s;->a(Landroidx/recyclerview/widget/RecyclerView;I)V

    if-nez p2, :cond_11

    .line 2
    iget-boolean p1, p0, Lb/p/d/n$a;->a:Z

    if-eqz p1, :cond_11

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lb/p/d/n$a;->a:Z

    .line 4
    iget-object p1, p0, Lb/p/d/n$a;->b:Lb/p/d/n;

    invoke-virtual {p1}, Lb/p/d/n;->c()V

    :cond_11
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;II)V
    .registers 4

    if-nez p2, :cond_4

    if-eqz p3, :cond_7

    :cond_4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lb/p/d/n$a;->a:Z

    :cond_7
    return-void
.end method
