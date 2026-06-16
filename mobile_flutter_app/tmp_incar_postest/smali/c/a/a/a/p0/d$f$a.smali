.class public Lc/a/a/a/p0/d$f$a;
.super Ljava/lang/Object;
.source "DropdownMenuEndIconDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/p0/d$f;->a(Lcom/google/android/material/textfield/TextInputLayout;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic h:Landroid/widget/AutoCompleteTextView;

.field public final synthetic i:Lc/a/a/a/p0/d$f;


# direct methods
.method public constructor <init>(Lc/a/a/a/p0/d$f;Landroid/widget/AutoCompleteTextView;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lc/a/a/a/p0/d$f$a;->i:Lc/a/a/a/p0/d$f;

    iput-object p2, p0, Lc/a/a/a/p0/d$f$a;->h:Landroid/widget/AutoCompleteTextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/p0/d$f$a;->h:Landroid/widget/AutoCompleteTextView;

    iget-object v1, p0, Lc/a/a/a/p0/d$f$a;->i:Lc/a/a/a/p0/d$f;

    iget-object v1, v1, Lc/a/a/a/p0/d$f;->a:Lc/a/a/a/p0/d;

    invoke-static {v1}, Lc/a/a/a/p0/d;->g(Lc/a/a/a/p0/d;)Landroid/text/TextWatcher;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/AutoCompleteTextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method
