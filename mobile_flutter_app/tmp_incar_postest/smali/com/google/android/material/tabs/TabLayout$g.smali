.class public Lcom/google/android/material/tabs/TabLayout$g;
.super Ljava/lang/Object;
.source "TabLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/material/tabs/TabLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field public a:Landroid/graphics/drawable/Drawable;

.field public b:Ljava/lang/CharSequence;

.field public c:Ljava/lang/CharSequence;

.field public d:I

.field public e:Landroid/view/View;

.field public f:I

.field public g:Lcom/google/android/material/tabs/TabLayout;

.field public h:Lcom/google/android/material/tabs/TabLayout$i;

.field public i:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->d:I

    const/4 v1, 0x1

    .line 3
    iput v1, p0, Lcom/google/android/material/tabs/TabLayout$g;->f:I

    .line 4
    iput v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->i:I

    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/tabs/TabLayout$g;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/TabLayout$g;->i:I

    return p0
.end method

.method public static synthetic b(Lcom/google/android/material/tabs/TabLayout$g;)I
    .registers 1

    .line 1
    iget p0, p0, Lcom/google/android/material/tabs/TabLayout$g;->f:I

    return p0
.end method

.method public static synthetic c(Lcom/google/android/material/tabs/TabLayout$g;)Ljava/lang/CharSequence;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/TabLayout$g;->c:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public static synthetic d(Lcom/google/android/material/tabs/TabLayout$g;)Ljava/lang/CharSequence;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/tabs/TabLayout$g;->b:Ljava/lang/CharSequence;

    return-object p0
.end method


# virtual methods
.method public a()Landroid/view/View;
    .registers 2

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->e:Landroid/view/View;

    return-object v0
.end method

.method public a(I)Lcom/google/android/material/tabs/TabLayout$g;
    .registers 5

    .line 5
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    const/4 v2, 0x0

    invoke-virtual {v0, p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/tabs/TabLayout$g;->a(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$g;

    return-object p0
.end method

.method public a(Landroid/graphics/drawable/Drawable;)Lcom/google/android/material/tabs/TabLayout$g;
    .registers 4

    .line 7
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->a:Landroid/graphics/drawable/Drawable;

    .line 8
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    iget v0, p1, Lcom/google/android/material/tabs/TabLayout;->D:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_e

    iget p1, p1, Lcom/google/android/material/tabs/TabLayout;->G:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_13

    .line 9
    :cond_e
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout;->a(Z)V

    .line 10
    :cond_13
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$g;->i()V

    .line 11
    sget-boolean p1, Lc/a/a/a/o/a;->a:Z

    if-eqz p1, :cond_33

    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    .line 12
    invoke-static {p1}, Lcom/google/android/material/tabs/TabLayout$i;->a(Lcom/google/android/material/tabs/TabLayout$i;)Z

    move-result p1

    if-eqz p1, :cond_33

    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    .line 13
    invoke-static {p1}, Lcom/google/android/material/tabs/TabLayout$i;->b(Lcom/google/android/material/tabs/TabLayout$i;)Lcom/google/android/material/badge/BadgeDrawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isVisible()Z

    move-result p1

    if-eqz p1, :cond_33

    .line 14
    iget-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->invalidate()V

    :cond_33
    return-object p0
.end method

.method public a(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$g;
    .registers 2

    .line 3
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->e:Landroid/view/View;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$g;->i()V

    return-object p0
.end method

.method public a(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$g;
    .registers 2

    .line 15
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->c:Ljava/lang/CharSequence;

    .line 16
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$g;->i()V

    return-object p0
.end method

.method public b()Landroid/graphics/drawable/Drawable;
    .registers 2

    .line 2
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->a:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public b(Ljava/lang/CharSequence;)Lcom/google/android/material/tabs/TabLayout$g;
    .registers 3

    .line 4
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->c:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_13

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 5
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 6
    :cond_13
    iput-object p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->b:Ljava/lang/CharSequence;

    .line 7
    invoke-virtual {p0}, Lcom/google/android/material/tabs/TabLayout$g;->i()V

    return-object p0
.end method

.method public b(I)V
    .registers 2

    .line 3
    iput p1, p0, Lcom/google/android/material/tabs/TabLayout$g;->d:I

    return-void
.end method

.method public c()I
    .registers 2

    .line 2
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->d:I

    return v0
.end method

.method public d()I
    .registers 2

    .line 2
    iget v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->f:I

    return v0
.end method

.method public e()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->b:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public f()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    if-eqz v0, :cond_10

    .line 2
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    move-result v0

    iget v1, p0, Lcom/google/android/material/tabs/TabLayout$g;->d:I

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    const/4 v0, 0x0

    :goto_f
    return v0

    .line 3
    :cond_10
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Tab not attached to a TabLayout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public g()V
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    .line 3
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->a:Landroid/graphics/drawable/Drawable;

    const/4 v1, -0x1

    .line 4
    iput v1, p0, Lcom/google/android/material/tabs/TabLayout$g;->i:I

    .line 5
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->b:Ljava/lang/CharSequence;

    .line 6
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->c:Ljava/lang/CharSequence;

    .line 7
    iput v1, p0, Lcom/google/android/material/tabs/TabLayout$g;->d:I

    .line 8
    iput-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->e:Landroid/view/View;

    return-void
.end method

.method public h()V
    .registers 3

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->g:Lcom/google/android/material/tabs/TabLayout;

    if-eqz v0, :cond_8

    .line 2
    invoke-virtual {v0, p0}, Lcom/google/android/material/tabs/TabLayout;->h(Lcom/google/android/material/tabs/TabLayout$g;)V

    return-void

    .line 3
    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Tab not attached to a TabLayout"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public i()V
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/tabs/TabLayout$g;->h:Lcom/google/android/material/tabs/TabLayout$i;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout$i;->h()V

    :cond_7
    return-void
.end method
