.class public Lb/h/m/h0/d$b;
.super Lb/h/m/h0/d$a;
.source "AccessibilityNodeProviderCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lb/h/m/h0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# direct methods
.method public constructor <init>(Lb/h/m/h0/d;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/h/m/h0/d$a;-><init>(Lb/h/m/h0/d;)V

    return-void
.end method


# virtual methods
.method public findFocus(I)Landroid/view/accessibility/AccessibilityNodeInfo;
    .registers 3

    .line 1
    iget-object v0, p0, Lb/h/m/h0/d$a;->a:Lb/h/m/h0/d;

    invoke-virtual {v0, p1}, Lb/h/m/h0/d;->b(I)Lb/h/m/h0/c;

    move-result-object p1

    if-nez p1, :cond_a

    const/4 p1, 0x0

    return-object p1

    .line 2
    :cond_a
    invoke-virtual {p1}, Lb/h/m/h0/c;->z()Landroid/view/accessibility/AccessibilityNodeInfo;

    move-result-object p1

    return-object p1
.end method
