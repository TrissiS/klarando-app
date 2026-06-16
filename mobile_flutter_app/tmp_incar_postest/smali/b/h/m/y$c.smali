.class public Lb/h/m/y$c;
.super Lb/h/m/y$g;
.source "ViewCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/h/m/y;->d()Lb/h/m/y$g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/h/m/y$g<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(ILjava/lang/Class;II)V
    .registers 5

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lb/h/m/y$g;-><init>(ILjava/lang/Class;II)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 2

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getAccessibilityPaneTitle()Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic a(Landroid/view/View;)Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/h/m/y$c;->a(Landroid/view/View;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/view/View;Ljava/lang/CharSequence;)V
    .registers 3

    .line 5
    invoke-virtual {p1, p2}, Landroid/view/View;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public bridge synthetic a(Landroid/view/View;Ljava/lang/Object;)V
    .registers 3

    .line 2
    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1, p2}, Lb/h/m/y$c;->a(Landroid/view/View;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    .registers 3

    .line 6
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public bridge synthetic a(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3

    .line 3
    check-cast p1, Ljava/lang/CharSequence;

    check-cast p2, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1, p2}, Lb/h/m/y$c;->a(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    return p1
.end method
