.class public Lb/b/q/j$a;
.super Ljava/lang/Object;
.source "AppCompatReceiveContentHelper.java"

# interfaces
.implements Lb/h/m/i0/b$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/b/q/j;->a(Landroid/view/View;)Lb/h/m/i0/b$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/b/q/j$a;->a:Landroid/view/View;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/h/m/i0/c;ILandroid/os/Bundle;)Z
    .registers 9

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x19

    if-lt v0, v3, :cond_31

    and-int/2addr p2, v2

    if-eqz p2, :cond_31

    .line 2
    :try_start_b
    invoke-virtual {p1}, Lb/h/m/i0/c;->d()V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_e} :catch_28

    .line 3
    invoke-virtual {p1}, Lb/h/m/i0/c;->e()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/inputmethod/InputContentInfo;

    if-nez p3, :cond_1c

    .line 4
    new-instance p3, Landroid/os/Bundle;

    invoke-direct {p3}, Landroid/os/Bundle;-><init>()V

    goto :goto_22

    :cond_1c
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, p3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    move-object p3, v0

    :goto_22
    const-string v0, "androidx.core.view.extra.INPUT_CONTENT_INFO"

    .line 5
    invoke-virtual {p3, v0, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_31

    :catch_28
    move-exception p1

    const-string p2, "ReceiveContent"

    const-string p3, "Can\'t insert content from IME; requestPermission() failed"

    .line 6
    invoke-static {p2, p3, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return v1

    .line 7
    :cond_31
    :goto_31
    new-instance p2, Landroid/content/ClipData;

    invoke-virtual {p1}, Lb/h/m/i0/c;->b()Landroid/content/ClipDescription;

    move-result-object v0

    new-instance v3, Landroid/content/ClipData$Item;

    .line 8
    invoke-virtual {p1}, Lb/h/m/i0/c;->a()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/content/ClipData$Item;-><init>(Landroid/net/Uri;)V

    invoke-direct {p2, v0, v3}, Landroid/content/ClipData;-><init>(Landroid/content/ClipDescription;Landroid/content/ClipData$Item;)V

    .line 9
    new-instance v0, Lb/h/m/c$a;

    const/4 v3, 0x2

    invoke-direct {v0, p2, v3}, Lb/h/m/c$a;-><init>(Landroid/content/ClipData;I)V

    .line 10
    invoke-virtual {p1}, Lb/h/m/i0/c;->c()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Lb/h/m/c$a;->a(Landroid/net/Uri;)Lb/h/m/c$a;

    .line 11
    invoke-virtual {v0, p3}, Lb/h/m/c$a;->a(Landroid/os/Bundle;)Lb/h/m/c$a;

    .line 12
    invoke-virtual {v0}, Lb/h/m/c$a;->a()Lb/h/m/c;

    move-result-object p1

    .line 13
    iget-object p2, p0, Lb/b/q/j$a;->a:Landroid/view/View;

    invoke-static {p2, p1}, Lb/h/m/y;->a(Landroid/view/View;Lb/h/m/c;)Lb/h/m/c;

    move-result-object p1

    if-nez p1, :cond_60

    const/4 v1, 0x1

    :cond_60
    return v1
.end method
