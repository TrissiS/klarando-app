.class public Lc/a/a/a/f0/c$a;
.super Ljava/lang/Object;
.source "NavigationBarMenuView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/f0/c;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/f0/c;


# direct methods
.method public constructor <init>(Lc/a/a/a/f0/c;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/f0/c$a;->h:Lc/a/a/a/f0/c;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 5

    .line 1
    check-cast p1, Lc/a/a/a/f0/a;

    .line 2
    invoke-virtual {p1}, Lc/a/a/a/f0/a;->getItemData()Lb/b/p/j/i;

    move-result-object p1

    .line 3
    iget-object v0, p0, Lc/a/a/a/f0/c$a;->h:Lc/a/a/a/f0/c;

    invoke-static {v0}, Lc/a/a/a/f0/c;->b(Lc/a/a/a/f0/c;)Lb/b/p/j/g;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/f0/c$a;->h:Lc/a/a/a/f0/c;

    invoke-static {v1}, Lc/a/a/a/f0/c;->a(Lc/a/a/a/f0/c;)Lcom/google/android/material/navigation/NavigationBarPresenter;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;Lb/b/p/j/m;I)Z

    move-result v0

    if-nez v0, :cond_1d

    const/4 v0, 0x1

    .line 4
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setChecked(Z)Landroid/view/MenuItem;

    :cond_1d
    return-void
.end method
