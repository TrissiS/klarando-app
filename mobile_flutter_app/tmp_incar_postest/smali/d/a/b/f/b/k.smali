.class public final Ld/a/b/f/b/k;
.super Ld/a/a/d$b;
.source "TipsDialog.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ld/a/a/d$m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ld/a/a/d$b<",
        "Ld/a/b/f/b/k;",
        ">;",
        "Ljava/lang/Runnable;",
        "Ld/a/a/d$m;"
    }
.end annotation


# instance fields
.field public final C:Landroid/widget/TextView;

.field public final D:Landroid/widget/ImageView;

.field public E:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/d$b;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x7d0

    .line 2
    iput p1, p0, Ld/a/b/f/b/k;->E:I

    const p1, 0x7f0b003c

    .line 3
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->c(I)Ld/a/a/d$b;

    const p1, 0x1030004

    .line 4
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->b(I)Ld/a/a/d$b;

    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->a(Z)Ld/a/a/d$b;

    .line 6
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->b(Z)Ld/a/a/d$b;

    const p1, 0x7f0801fa

    .line 7
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld/a/b/f/b/k;->C:Landroid/widget/TextView;

    const p1, 0x7f0800dc

    .line 8
    invoke-virtual {p0, p1}, Ld/a/a/d$b;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Ld/a/b/f/b/k;->D:Landroid/widget/ImageView;

    .line 9
    invoke-virtual {p0, p0}, Ld/a/a/d$b;->a(Ld/a/a/d$m;)Ld/a/a/d$b;

    return-void
.end method


# virtual methods
.method public a()Ld/a/a/d;
    .registers 3

    .line 2
    iget-object v0, p0, Ld/a/b/f/b/k;->D:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_25

    .line 3
    iget-object v0, p0, Ld/a/b/f/b/k;->C:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1d

    .line 4
    invoke-super {p0}, Ld/a/a/d$b;->a()Ld/a/a/d;

    move-result-object v0

    return-object v0

    .line 5
    :cond_1d
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Dialog message not null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 6
    :cond_25
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The display type must be specified"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public a(Ljava/lang/CharSequence;)Ld/a/b/f/b/k;
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/k;->C:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-object p0
.end method

.method public a(Ld/a/a/d;)V
    .registers 4

    .line 7
    iget p1, p0, Ld/a/b/f/b/k;->E:I

    int-to-long v0, p1

    invoke-virtual {p0, p0, v0, v1}, Ld/a/a/d$b;->a(Ljava/lang/Runnable;J)V

    return-void
.end method

.method public g(I)Ld/a/b/f/b/k;
    .registers 3

    .line 1
    iget-object v0, p0, Ld/a/b/f/b/k;->D:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-object p0
.end method

.method public h(I)Ld/a/b/f/b/k;
    .registers 2

    .line 1
    invoke-interface {p0, p1}, Ld/a/a/g/k;->a(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ld/a/b/f/b/k;->a(Ljava/lang/CharSequence;)Ld/a/b/f/b/k;

    return-object p0
.end method

.method public run()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Ld/a/a/d$b;->g()Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 2
    :cond_7
    invoke-virtual {p0}, Ld/a/a/d$b;->b()V

    return-void
.end method
