.class public Lc/a/a/a/q/a;
.super Lc/a/a/a/f0/a;
.source "BottomNavigationItemView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/f0/a;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getItemDefaultMarginResId()I
    .registers 2

    .line 1
    sget v0, Lc/a/a/a/d;->design_bottom_navigation_margin:I

    return v0
.end method

.method public getItemLayoutResId()I
    .registers 2

    .line 1
    sget v0, Lc/a/a/a/h;->design_bottom_navigation_item:I

    return v0
.end method
