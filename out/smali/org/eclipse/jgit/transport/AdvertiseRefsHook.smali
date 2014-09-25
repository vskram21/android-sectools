.class public interface abstract Lorg/eclipse/jgit/transport/AdvertiseRefsHook;
.super Ljava/lang/Object;
.source "AdvertiseRefsHook.java"


# static fields
.field public static final DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Lorg/eclipse/jgit/transport/AdvertiseRefsHook$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/AdvertiseRefsHook$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/AdvertiseRefsHook;->DEFAULT:Lorg/eclipse/jgit/transport/AdvertiseRefsHook;

    return-void
.end method


# virtual methods
.method public abstract advertiseRefs(Lorg/eclipse/jgit/transport/BaseReceivePack;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation
.end method

.method public abstract advertiseRefs(Lorg/eclipse/jgit/transport/UploadPack;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/eclipse/jgit/transport/ServiceMayNotContinueException;
        }
    .end annotation
.end method
