.class public Lc/a/a/a/d0/f$h;
.super Lb/p/d/k;
.source "NavigationMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/d0/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "h"
.end annotation


# instance fields
.field public final synthetic f:Lc/a/a/a/d0/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/d0/f;Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/f$h;->f:Lc/a/a/a/d0/f;

    .line 2
    invoke-direct {p0, p2}, Lb/p/d/k;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/h0/c;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2}, Lb/p/d/k;->a(Landroid/view/View;Lb/h/m/h0/c;)V

    .line 2
    iget-object p1, p0, Lc/a/a/a/d0/f$h;->f:Lc/a/a/a/d0/f;

    iget-object p1, p1, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {p1}, Lc/a/a/a/d0/f$c;->i()I

    move-result p1

    const/4 v0, 0x0

    invoke-static {p1, v0, v0}, Lb/h/m/h0/c$b;->a(IIZ)Lb/h/m/h0/c$b;

    move-result-object p1

    invoke-virtual {p2, p1}, Lb/h/m/h0/c;->a(Ljava/lang/Object;)V

    return-void
.end method
