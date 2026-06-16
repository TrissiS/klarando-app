.class public Lc/a/a/a/d0/g;
.super Lb/b/p/j/r;
.source "NavigationSubMenu.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Lc/a/a/a/d0/e;Lb/b/p/j/i;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lb/b/p/j/r;-><init>(Landroid/content/Context;Lb/b/p/j/g;Lb/b/p/j/i;)V

    return-void
.end method


# virtual methods
.method public c(Z)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Lb/b/p/j/g;->c(Z)V

    .line 2
    invoke-virtual {p0}, Lb/b/p/j/r;->t()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Lb/b/p/j/g;

    invoke-virtual {v0, p1}, Lb/b/p/j/g;->c(Z)V

    return-void
.end method
