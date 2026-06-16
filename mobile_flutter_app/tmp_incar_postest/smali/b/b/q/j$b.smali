.class public final Lb/b/q/j$b;
.super Ljava/lang/Object;
.source "AppCompatReceiveContentHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/b/q/j;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# direct methods
.method public static a(Landroid/view/DragEvent;Landroid/view/View;Landroid/app/Activity;)Z
    .registers 4

    .line 10
    invoke-virtual {p2, p0}, Landroid/app/Activity;->requestDragAndDropPermissions(Landroid/view/DragEvent;)Landroid/view/DragAndDropPermissions;

    .line 11
    new-instance p2, Lb/h/m/c$a;

    .line 12
    invoke-virtual {p0}, Landroid/view/DragEvent;->getClipData()Landroid/content/ClipData;

    move-result-object p0

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lb/h/m/c$a;-><init>(Landroid/content/ClipData;I)V

    invoke-virtual {p2}, Lb/h/m/c$a;->a()Lb/h/m/c;

    move-result-object p0

    .line 13
    invoke-static {p1, p0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/c;)Lb/h/m/c;

    const/4 p0, 0x1

    return p0
.end method

.method public static a(Landroid/view/DragEvent;Landroid/widget/TextView;Landroid/app/Activity;)Z
    .registers 4

    .line 1
    invoke-virtual {p2, p0}, Landroid/app/Activity;->requestDragAndDropPermissions(Landroid/view/DragEvent;)Landroid/view/DragAndDropPermissions;

    .line 2
    invoke-virtual {p0}, Landroid/view/DragEvent;->getX()F

    move-result p2

    invoke-virtual {p0}, Landroid/view/DragEvent;->getY()F

    move-result v0

    invoke-virtual {p1, p2, v0}, Landroid/widget/TextView;->getOffsetForPosition(FF)I

    move-result p2

    .line 3
    invoke-virtual {p1}, Landroid/widget/TextView;->beginBatchEdit()V

    .line 4
    :try_start_12
    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast v0, Landroid/text/Spannable;

    invoke-static {v0, p2}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;I)V

    .line 5
    new-instance p2, Lb/h/m/c$a;

    .line 6
    invoke-virtual {p0}, Landroid/view/DragEvent;->getClipData()Landroid/content/ClipData;

    move-result-object p0

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lb/h/m/c$a;-><init>(Landroid/content/ClipData;I)V

    invoke-virtual {p2}, Lb/h/m/c$a;->a()Lb/h/m/c;

    move-result-object p0

    .line 7
    invoke-static {p1, p0}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/c;)Lb/h/m/c;
    :try_end_2c
    .catchall {:try_start_12 .. :try_end_2c} :catchall_31

    .line 8
    invoke-virtual {p1}, Landroid/widget/TextView;->endBatchEdit()V

    const/4 p0, 0x1

    return p0

    :catchall_31
    move-exception p0

    invoke-virtual {p1}, Landroid/widget/TextView;->endBatchEdit()V

    .line 9
    throw p0
.end method
