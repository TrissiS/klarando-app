.class public Lc/a/a/a/p0/d$a$a;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/d$a;->afterTextChanged(Landroid/text/Editable;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/widget/AutoCompleteTextView;

.field public final synthetic i:Lc/a/a/a/p0/d$a;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d$a;Landroid/widget/AutoCompleteTextView;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$a$a;->i:Lc/a/a/a/p0/d$a;

    iput-object p2, p0, Lc/a/a/a/p0/d$a$a;->h:Landroid/widget/AutoCompleteTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/d$a$a;->h:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->isPopupShowing()Z

    move-result v0

    .line 2
    iget-object v1, p0, Lc/a/a/a/p0/d$a$a;->i:Lc/a/a/a/p0/d$a;

    iget-object v1, v1, Lc/a/a/a/p0/d$a;->h:Lc/a/a/a/p0/d;

    invoke-static {v1, v0}, Lc/a/a/a/p0/d;->a(Lc/a/a/a/p0/d;Z)V

    .line 3
    iget-object v1, p0, Lc/a/a/a/p0/d$a$a;->i:Lc/a/a/a/p0/d$a;

    iget-object v1, v1, Lc/a/a/a/p0/d$a;->h:Lc/a/a/a/p0/d;

    invoke-static {v1, v0}, Lc/a/a/a/p0/d;->b(Lc/a/a/a/p0/d;Z)Z

    return-void
.end method
