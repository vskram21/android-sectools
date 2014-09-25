.class Lorg/eclipse/jgit/util/FS_Win32_Cygwin$2;
.super Ljava/lang/Object;
.source "FS_Win32_Cygwin.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jgit/util/FS_Win32_Cygwin;->userHomeImpl()Ljava/io/File;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jgit/util/FS_Win32_Cygwin;


# direct methods
.method constructor <init>(Lorg/eclipse/jgit/util/FS_Win32_Cygwin;)V
    .locals 0
    .parameter

    .prologue
    .line 116
    iput-object p1, p0, Lorg/eclipse/jgit/util/FS_Win32_Cygwin$2;->this$0:Lorg/eclipse/jgit/util/FS_Win32_Cygwin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic run()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 116
    invoke-virtual {p0}, Lorg/eclipse/jgit/util/FS_Win32_Cygwin$2;->run()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()Ljava/lang/String;
    .locals 1

    .prologue
    .line 118
    const-string v0, "HOME"

    invoke-static {v0}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
