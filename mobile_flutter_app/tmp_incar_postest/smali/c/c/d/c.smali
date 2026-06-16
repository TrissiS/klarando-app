.class public final Lc/c/d/c;
.super Ljava/lang/Object;
.source "ActivityToast.java"

# interfaces
.implements Lc/c/d/k/b;


# instance fields
.field public final a:Lc/c/d/g;

.field public b:Landroid/view/View;

.field public c:Landroid/widget/TextView;

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:F

.field public i:F


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lc/c/d/g;

    invoke-direct {v0, p1, p0}, Lc/c/d/g;-><init>(Landroid/app/Activity;Lc/c/d/k/b;)V

    iput-object v0, p0, Lc/c/d/c;->a:Lc/c/d/g;

    return-void
.end method


# virtual methods
.method public synthetic a(Landroid/view/View;)Landroid/widget/TextView;
    .registers 2

    invoke-static {p0, p1}, Lc/c/d/k/a;->a(Lc/c/d/k/b;Landroid/view/View;)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method public cancel()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/d/c;->a:Lc/c/d/g;

    invoke-virtual {v0}, Lc/c/d/g;->a()V

    return-void
.end method

.method public getDuration()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/c;->e:I

    return v0
.end method

.method public getGravity()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/c;->d:I

    return v0
.end method

.method public getHorizontalMargin()F
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/c;->h:F

    return v0
.end method

.method public getVerticalMargin()F
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/c;->i:F

    return v0
.end method

.method public getView()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/d/c;->b:Landroid/view/View;

    return-object v0
.end method

.method public getXOffset()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/c;->f:I

    return v0
.end method

.method public getYOffset()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/d/c;->g:I

    return v0
.end method

.method public setDuration(I)V
    .registers 2

    .line 1
    iput p1, p0, Lc/c/d/c;->e:I

    return-void
.end method

.method public setGravity(III)V
    .registers 4

    .line 1
    iput p1, p0, Lc/c/d/c;->d:I

    .line 2
    iput p2, p0, Lc/c/d/c;->f:I

    .line 3
    iput p3, p0, Lc/c/d/c;->g:I

    return-void
.end method

.method public setMargin(FF)V
    .registers 3

    .line 1
    iput p1, p0, Lc/c/d/c;->h:F

    .line 2
    iput p2, p0, Lc/c/d/c;->i:F

    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/d/c;->c:Landroid/widget/TextView;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setView(Landroid/view/View;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/c/d/c;->b:Landroid/view/View;

    if-nez p1, :cond_8

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lc/c/d/c;->c:Landroid/widget/TextView;

    return-void

    .line 3
    :cond_8
    invoke-interface {p0, p1}, Lc/c/d/k/b;->a(Landroid/view/View;)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lc/c/d/c;->c:Landroid/widget/TextView;

    return-void
.end method

.method public show()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/d/c;->a:Lc/c/d/g;

    invoke-virtual {v0}, Lc/c/d/g;->c()V

    return-void
.end method
