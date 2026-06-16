.class public Lc/a/a/a/p0/d$c;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/p0/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$c;->h:Lc/a/a/a/p0/d;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFocusChange(Landroid/view/View;Z)V
    .registers 3

    .line 1
    iget-object p1, p0, Lc/a/a/a/p0/d$c;->h:Lc/a/a/a/p0/d;

    iget-object p1, p1, Lc/a/a/a/p0/e;->a:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {p1, p2}, Lcom/google/android/material/textfield/TextInputLayout;->setEndIconActivated(Z)V

    if-nez p2, :cond_14

    .line 2
    iget-object p1, p0, Lc/a/a/a/p0/d$c;->h:Lc/a/a/a/p0/d;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;Z)V

    .line 3
    iget-object p1, p0, Lc/a/a/a/p0/d$c;->h:Lc/a/a/a/p0/d;

    invoke-static {p1, p2}, Lc/a/a/a/p0/d;->b(Lc/a/a/a/p0/d;Z)Z

    :cond_14
    return-void
.end method
