.class public final Lnet/nyx/widget/view/CountdownView;
.super Landroidx/appcompat/widget/AppCompatTextView;
.source "CountdownView.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public m:I

.field public n:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 2
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public e()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lnet/nyx/widget/view/CountdownView;->m:I

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/CountdownView;->n:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setEnabled(Z)V

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 1

    .line 1
    invoke-super {p0}, Landroid/widget/TextView;->onDetachedFromWindow()V

    .line 2
    invoke-virtual {p0, p0}, Landroid/widget/TextView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public run()V
    .registers 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/CountdownView;->m:I

    if-nez v0, :cond_8

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/view/CountdownView;->e()V

    return-void

    :cond_8
    add-int/lit8 v0, v0, -0x1

    .line 3
    iput v0, p0, Lnet/nyx/widget/view/CountdownView;->m:I

    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget v1, p0, Lnet/nyx/widget/view/CountdownView;->m:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "S"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-wide/16 v0, 0x3e8

    .line 5
    invoke-virtual {p0, p0, v0, v1}, Landroid/widget/TextView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public setTotalTime(I)V
    .registers 2

    return-void
.end method
