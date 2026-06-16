.class public Landroidx/viewpager2/widget/ViewPager2$l;
.super Lb/p/d/j;
.source "ViewPager2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/viewpager2/widget/ViewPager2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "l"
.end annotation


# instance fields
.field public final synthetic e:Landroidx/viewpager2/widget/ViewPager2;


# direct methods
.method public constructor <init>(Landroidx/viewpager2/widget/ViewPager2;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/viewpager2/widget/ViewPager2$l;->e:Landroidx/viewpager2/widget/ViewPager2;

    invoke-direct {p0}, Lb/p/d/j;-><init>()V

    return-void
.end method


# virtual methods
.method public c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/viewpager2/widget/ViewPager2$l;->e:Landroidx/viewpager2/widget/ViewPager2;

    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->b()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p1, 0x0

    goto :goto_e

    :cond_a
    invoke-super {p0, p1}, Lb/p/d/j;->c(Landroidx/recyclerview/widget/RecyclerView$o;)Landroid/view/View;

    move-result-object p1

    :goto_e
    return-object p1
.end method
