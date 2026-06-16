.class public Lc/c/d/f;
.super Landroid/widget/Toast;
.source "SystemToast.java"

# interfaces
.implements Lc/c/d/k/b;


# instance fields
.field public a:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/app/Application;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/Toast;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public synthetic a(Landroid/view/View;)Landroid/widget/TextView;
    .registers 2

    invoke-static {p0, p1}, Lc/c/d/k/a;->a(Lc/c/d/k/b;Landroid/view/View;)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Toast;->setText(Ljava/lang/CharSequence;)V

    .line 2
    iget-object v0, p0, Lc/c/d/f;->a:Landroid/widget/TextView;

    if-nez v0, :cond_8

    return-void

    .line 3
    :cond_8
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setView(Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/Toast;->setView(Landroid/view/View;)V

    if-nez p1, :cond_9

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lc/c/d/f;->a:Landroid/widget/TextView;

    return-void

    .line 3
    :cond_9
    invoke-interface {p0, p1}, Lc/c/d/k/b;->a(Landroid/view/View;)Landroid/widget/TextView;

    move-result-object p1

    iput-object p1, p0, Lc/c/d/f;->a:Landroid/widget/TextView;

    return-void
.end method
