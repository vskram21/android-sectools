.class public interface abstract Lorg/eclipse/jgit/transport/RefFilter;
.super Ljava/lang/Object;
.source "RefFilter.java"


# static fields
.field public static final DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 61
    new-instance v0, Lorg/eclipse/jgit/transport/RefFilter$1;

    invoke-direct {v0}, Lorg/eclipse/jgit/transport/RefFilter$1;-><init>()V

    sput-object v0, Lorg/eclipse/jgit/transport/RefFilter;->DEFAULT:Lorg/eclipse/jgit/transport/RefFilter;

    return-void
.end method


# virtual methods
.method public abstract filter(Ljava/util/Map;)Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/eclipse/jgit/lib/Ref;",
            ">;"
        }
    .end annotation
.end method
