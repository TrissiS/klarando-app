.class public Lc/a/a/a/d0/f$a;
.super Ljava/lang/Object;
.source "NavigationMenuPresenter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/d0/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/d0/f;


# direct methods
.method public constructor <init>(Lc/a/a/a/d0/f;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/f$a;->h:Lc/a/a/a/d0/f;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 6

    .line 1
    check-cast p1, Lcom/google/android/material/internal/NavigationMenuItemView;

    .line 2
    iget-object v0, p0, Lc/a/a/a/d0/f$a;->h:Lc/a/a/a/d0/f;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lc/a/a/a/d0/f;->c(Z)V

    .line 3
    invoke-virtual {p1}, Lcom/google/android/material/internal/NavigationMenuItemView;->getItemData()Lb/b/p/j/i;

    move-result-object p1

    .line 4
    iget-object v0, p0, Lc/a/a/a/d0/f$a;->h:Lc/a/a/a/d0/f;

    iget-object v2, v0, Lc/a/a/a/d0/f;->k:Lb/b/p/j/g;

    const/4 v3, 0x0

    invoke-virtual {v2, p1, v0, v3}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;Lb/b/p/j/m;I)Z

    move-result v0

    if-eqz p1, :cond_27

    .line 5
    invoke-virtual {p1}, Lb/b/p/j/i;->isCheckable()Z

    move-result v2

    if-eqz v2, :cond_27

    if-eqz v0, :cond_27

    .line 6
    iget-object v0, p0, Lc/a/a/a/d0/f$a;->h:Lc/a/a/a/d0/f;

    iget-object v0, v0, Lc/a/a/a/d0/f;->m:Lc/a/a/a/d0/f$c;

    invoke-virtual {v0, p1}, Lc/a/a/a/d0/f$c;->a(Lb/b/p/j/i;)V

    goto :goto_28

    :cond_27
    const/4 v1, 0x0

    .line 7
    :goto_28
    iget-object p1, p0, Lc/a/a/a/d0/f$a;->h:Lc/a/a/a/d0/f;

    invoke-virtual {p1, v3}, Lc/a/a/a/d0/f;->c(Z)V

    if-eqz v1, :cond_34

    .line 8
    iget-object p1, p0, Lc/a/a/a/d0/f$a;->h:Lc/a/a/a/d0/f;

    invoke-virtual {p1, v3}, Lc/a/a/a/d0/f;->a(Z)V

    :cond_34
    return-void
.end method
