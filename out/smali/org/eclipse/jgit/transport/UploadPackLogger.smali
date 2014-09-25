.class public interface abstract Lorg/eclipse/jgit/transport/UploadPackLogger;
.super Ljava/lang/Object;
.source "UploadPackLogger.java"


# static fields
.field public static final NULL:Lorg/eclipse/jgit/transport/UploadPackLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    new-instance v0, Lorg/eclipse/jgit/transport/UploadPackLogger$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/UploadPackLogger$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/UploadPackLogger;->NULL:Lorg/eclipse/jgit/transport/UploadPackLogger;

    return-void
.end method


# virtual methods
.method public abstract onPackStatistics(Lorg/eclipse/jgit/internal/storage/pack/PackWriter$Statistics;)V
.end method
