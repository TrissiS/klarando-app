.class public final Lb/h/n/j;
.super Ljava/lang/Object;
.source "TextViewOnReceiveContentListener.java"

# interfaces
.implements Lb/h/m/t;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/h/n/j$b;,
        Lb/h/n/j$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/content/ClipData;Landroid/content/Context;I)Ljava/lang/CharSequence;
    .registers 6

    .line 19
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 20
    :goto_6
    invoke-virtual {p0}, Landroid/content/ClipData;->getItemCount()I

    move-result v2

    if-ge v1, v2, :cond_1c

    .line 21
    invoke-virtual {p0, v1}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v2

    invoke-static {p1, v2, p2}, Lb/h/n/j;->a(Landroid/content/Context;Landroid/content/ClipData$Item;I)Ljava/lang/CharSequence;

    move-result-object v2

    if-eqz v2, :cond_19

    .line 22
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_1c
    return-object v0
.end method

.method public static a(Landroid/content/Context;Landroid/content/ClipData$Item;I)Ljava/lang/CharSequence;
    .registers 5

    .line 23
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_b

    .line 24
    invoke-static {p0, p1, p2}, Lb/h/n/j$a;->a(Landroid/content/Context;Landroid/content/ClipData$Item;I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    .line 25
    :cond_b
    invoke-static {p0, p1, p2}, Lb/h/n/j$b;->a(Landroid/content/Context;Landroid/content/ClipData$Item;I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/text/Editable;Ljava/lang/CharSequence;)V
    .registers 6

    .line 26
    invoke-static {p0}, Landroid/text/Selection;->getSelectionStart(Ljava/lang/CharSequence;)I

    move-result v0

    .line 27
    invoke-static {p0}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v1

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 29
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    .line 30
    invoke-static {p0, v0}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 31
    invoke-interface {p0, v2, v0, p1}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    return-void
.end method

.method public static a(Landroid/widget/TextView;Lb/h/m/c;)V
    .registers 4

    .line 15
    invoke-virtual {p1}, Lb/h/m/c;->a()Landroid/content/ClipData;

    move-result-object v0

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 16
    invoke-virtual {p1}, Lb/h/m/c;->b()I

    move-result p1

    .line 17
    invoke-static {v0, v1, p1}, Lb/h/n/j;->a(Landroid/content/ClipData;Landroid/content/Context;I)Ljava/lang/CharSequence;

    move-result-object p1

    .line 18
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p0

    check-cast p0, Landroid/text/Editable;

    invoke-static {p0, p1}, Lb/h/n/j;->a(Landroid/text/Editable;Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;Lb/h/m/c;)Lb/h/m/c;
    .registers 11

    const/4 v0, 0x3

    const-string v1, "ReceiveContent"

    .line 1
    invoke-static {v1, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 3
    :cond_1d
    invoke-virtual {p2}, Lb/h/m/c;->c()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_25

    return-object p2

    :cond_25
    const/4 v2, 0x0

    if-ne v1, v0, :cond_2e

    .line 4
    check-cast p1, Landroid/widget/TextView;

    invoke-static {p1, p2}, Lb/h/n/j;->a(Landroid/widget/TextView;Lb/h/m/c;)V

    return-object v2

    .line 5
    :cond_2e
    invoke-virtual {p2}, Lb/h/m/c;->a()Landroid/content/ClipData;

    move-result-object v0

    .line 6
    invoke-virtual {p2}, Lb/h/m/c;->b()I

    move-result p2

    .line 7
    check-cast p1, Landroid/widget/TextView;

    .line 8
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v1

    check-cast v1, Landroid/text/Editable;

    .line 9
    invoke-virtual {p1}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 10
    :goto_44
    invoke-virtual {v0}, Landroid/content/ClipData;->getItemCount()I

    move-result v5

    if-ge v3, v5, :cond_6e

    .line 11
    invoke-virtual {v0, v3}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v5

    invoke-static {p1, v5, p2}, Lb/h/n/j;->a(Landroid/content/Context;Landroid/content/ClipData$Item;I)Ljava/lang/CharSequence;

    move-result-object v5

    if-eqz v5, :cond_6b

    if-nez v4, :cond_5b

    .line 12
    invoke-static {v1, v5}, Lb/h/n/j;->a(Landroid/text/Editable;Ljava/lang/CharSequence;)V

    const/4 v4, 0x1

    goto :goto_6b

    .line 13
    :cond_5b
    invoke-static {v1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v6

    const-string v7, "\n"

    invoke-interface {v1, v6, v7}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 14
    invoke-static {v1}, Landroid/text/Selection;->getSelectionEnd(Ljava/lang/CharSequence;)I

    move-result v6

    invoke-interface {v1, v6, v5}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    :cond_6b
    :goto_6b
    add-int/lit8 v3, v3, 0x1

    goto :goto_44

    :cond_6e
    return-object v2
.end method
