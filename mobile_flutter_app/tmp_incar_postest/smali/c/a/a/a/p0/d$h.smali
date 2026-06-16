.class public Lc/a/a/a/p0/d$h;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/d;->c(Landroid/widget/AutoCompleteTextView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/widget/AutoCompleteTextView;

.field public final synthetic i:Lc/a/a/a/p0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$h;->i:Lc/a/a/a/p0/d;

    iput-object p2, p0, Lc/a/a/a/p0/d$h;->h:Landroid/widget/AutoCompleteTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .registers 4

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1c

    .line 2
    iget-object p1, p0, Lc/a/a/a/p0/d$h;->i:Lc/a/a/a/p0/d;

    invoke-static {p1}, Lc/a/a/a/p0/d;->d(Lc/a/a/a/p0/d;)Z

    move-result p1

    if-eqz p1, :cond_15

    .line 3
    iget-object p1, p0, Lc/a/a/a/p0/d$h;->i:Lc/a/a/a/p0/d;

    invoke-static {p1, p2}, Lc/a/a/a/p0/d;->b(Lc/a/a/a/p0/d;Z)Z

    .line 4
    :cond_15
    iget-object p1, p0, Lc/a/a/a/p0/d$h;->i:Lc/a/a/a/p0/d;

    iget-object v0, p0, Lc/a/a/a/p0/d$h;->h:Landroid/widget/AutoCompleteTextView;

    invoke-static {p1, v0}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;Landroid/widget/AutoCompleteTextView;)V

    :cond_1c
    return p2
.end method
