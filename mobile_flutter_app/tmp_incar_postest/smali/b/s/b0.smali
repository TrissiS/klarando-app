.class public Lb/s/b0;
.super Lb/s/g0;
.source "ViewGroupOverlayApi14.java"

# interfaces
.implements Lb/s/d0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lb/s/g0;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method

.method public static a(Landroid/view/ViewGroup;)Lb/s/b0;
    .registers 1

    .line 1
    invoke-static {p0}, Lb/s/g0;->c(Landroid/view/View;)Lb/s/g0;

    move-result-object p0

    check-cast p0, Lb/s/b0;

    return-object p0
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/s/g0;->a:Lb/s/g0$a;

    invoke-virtual {v0, p1}, Lb/s/g0$a;->a(Landroid/view/View;)V

    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/s/g0;->a:Lb/s/g0$a;

    invoke-virtual {v0, p1}, Lb/s/g0$a;->b(Landroid/view/View;)V

    return-void
.end method
